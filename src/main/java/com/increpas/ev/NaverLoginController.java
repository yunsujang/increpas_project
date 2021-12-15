package com.increpas.ev;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ev.vo.EvuserVO;
import spring.service.LogInterface;
import user.service.LoginService;
import user.util.SecureUtil;

@Controller
public class NaverLoginController {
	
	private int cnt = 1;

	@Autowired
	private LogInterface loginService;

	@Autowired
	private LoginService l_service;
	
	@Autowired
	private HttpSession session;
	
	private String state;
	private String code;
	private String access_token;
	private String refresh_token;
	private String token_type;
	private String returnUrl;
	private final String naverClientId = "huBHKZ45iwN_Zzixb_2q";
	private final String naverClientSecret = "jzOL3hxaN8";

	// MemberDAO 등이 들어와야함

	@Autowired(required = true) // required = true는 무조건 들어오라는 뜻
	private HttpServletRequest request;

	@RequestMapping("/naverLogin.inc")
	public String makeNaverRequestStatement() {
		HashMap<String, String> naverurl = loginService.makeNaverRequestStatement(naverClientId);
		state = (String) naverurl.get("state");
		returnUrl = request.getHeader("referer");

		return "redirect:" + (String) naverurl.get("url");
	}

	@RequestMapping("/naverRequestKey.inc")
	public String getNaverRequestKey(@RequestParam("state") String state, @RequestParam("code") String code) {

		HttpSession session = request.getSession();
		if (state.equals(this.state))
			session.setAttribute("isLoged", Boolean.valueOf(true));

		else {
			session.setAttribute("isLoged", Boolean.valueOf(false));
			return "redirect:/";
		}

		this.code = code;
		HashMap<String, String> result = loginService.getNaverRequestKey(state, code, naverClientId, naverClientSecret);

		access_token = (String) result.get("access_token");
		refresh_token = (String) result.get("refresh_token");
		token_type = (String) result.get("token_type");

		return "redirect:/naverRequestUserInfo.inc";
	}

	@RequestMapping("/naverRequestUserInfo.inc")
	public String naverRequestUserInfo() {
		HashMap<String, String> result = loginService.naverRequestUserInfo(token_type, access_token);
		String id = result.get("id");
		String email = result.get("email");
		String nickname = result.get("nickname");
		String age = result.get("age");
		String gender = result.get("gender");
		String birthday = result.get("birthday");
		EvuserVO evo = l_service.getComp(id);
		if(evo == null) {
			System.out.println(id);
			evo = new EvuserVO(id, "1111", nickname, email, "010", "salt");
			String comp = SecureUtil.generateSalt();
			evo.setEvu_comp(comp);
			evo.setEvu_pw(SecureUtil.getEncrypt(evo.getEvu_pw(), comp));
			l_service.reg(evo);
		}
		session.setAttribute("mvo", evo);
		session.setAttribute("grade", 2);
		return "redirect:/";
	}

	@RequestMapping("/naverlogout")
	   public String naverLogin() throws Exception {
	      String outUrl = "https://nid.naver.com/oauth2.0/token?";
	      
	      URL url = new URL(outUrl);
	      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	      conn.setRequestMethod("POST");
	      conn.setDoOutput(true);
	      
	      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	      StringBuffer sb = new StringBuffer();
	      sb.append("grant_type=delete");
	      sb.append("&client_id="+naverClientId);
	      sb.append("&client_secret="+naverClientSecret);
	      sb.append("&access_token="+access_token);
	      sb.append("&service_provider=NAVER");
	      
	      bw.write(sb.toString());
	      bw.flush();
	      
	      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	      StringBuffer result = new StringBuffer();
	      String str = null;
	      
	      while((str = br.readLine()) != null) 
	         result.append(str);

	      JSONParser pa = new JSONParser();
	      Object obj = pa.parse(result.toString());
	      JSONObject sob = (JSONObject) obj;

	      String success = (String) sob.get("result");
	      
	      String state = "success";
	      
	      if(state.equals(success)) {
	         session.removeAttribute("mvo");
	         session.removeAttribute("grade");
	         return "redirect:/";
	      }else {
	         // 네이버 토큰을 삭제하지 못 했을 경우이다.
	         // 로그아웃을 못 할때 404? 보낼까유?
	      }
	      
	      return sb.toString();
	   }
}
