package com.increpas.ev;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.EvuserVO;
import user.service.LoginService;
import user.util.SecureUtil;

@Controller
public class KakaoController {

	private int cnt;

	@Autowired
	LoginService l_service;

	@Autowired
	HttpSession session;

	@RequestMapping("/kakao/login")
	public ModelAndView login(String code) {
		// 카카오 서버에서 인증코드를 전달해주는 곳
		ModelAndView mv = new ModelAndView();

		// 카카오 서버가 인자로 전달해준 인증코드가 code라는 변수로 받는다.
		// System.out.println(code);

		// 받은 코드를 가지고 2번째 요청인 토큰을 받기위한 작업
		String access_token = "", refresh_token = "", reqURL = "https://kauth.kakao.com/oauth/token";

		// POST방식으로 요청하는 법
		try {
			// 웹 상의 경로를 객체화시킨다.
			URL url = new URL(reqURL);

			// 웹 상의 경로와 연결한다.
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// 포스트 방식으로 요청하기 위해
			// setDoOutput을 true로 지정한다.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// 전달하고자 하는 파라미터들을 보낼 OutputStream준비
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			// 파라미터 4개를 만들어서 bw를 통해 카카오 서버로 보낸다.
			// grant_type = authorization_code
			// client_id = 앱 REST API 키
			// redirect_uri = 인가 코드가 리다이렉트된 URI
			// code = 인가 코드 받기 요청으로 얻은 인가 코드

			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=2607276a96ddce57fde052a792d1810b");
			sb.append("&redirect_uri=http://localhost:9090/kakao/login");
			sb.append("&code=");
			sb.append(code);
			bw.write(sb.toString());
			// 이로써 준비된 인자를 카카오 서버로 보냈다.
			bw.flush(); // bufferedWriter 비우기

			int res_code = conn.getResponseCode();
			System.out.println(res_code);

			if (res_code == 200) {
				// 요청을 통해 얻은 JSON타입의 결과메세지를 읽어온다.
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

				StringBuffer result = new StringBuffer();
				String line = null;

				while ((line = br.readLine()) != null) {
					result.append(line);
				} // while문 끝
				System.out.println(result.toString());

				// JSON 파싱 처리
				// 카카오 서버에서 인자로 넘어온
				// "access_token","refresh_token"를 통해
				// 카카오 API요청을 한 후 ModelAndView로 저장하여
				// result.jsp에서 결과를 표현하려고 한다.

				// 문자열 형식의 JSON표기법으로 되어 있는 것을
				// JSON객체로 변환해주는 라이브러리(Simple-JSON)
				JSONParser parse = new JSONParser();
				Object obj = parse.parse(result.toString());
				JSONObject json = (JSONObject) obj;
				access_token = (String) json.get("access_token");
				refresh_token = (String) json.get("refresh_token");

				System.out.println(access_token + "/" + refresh_token);
				System.out.println("나는 access_token : " + access_token);
				System.out.println("나는 refresh_token : " + refresh_token);

				// 마지막 3번째 호출은 사용자 정보 요청
				String header = "Bearer " + access_token;
				String apiURL = "https://kapi.kakao.com/v2/user/me";

				// 자바 객체에서 특정 웹상의 경로를
				// 호출하기 위해서는 먼저 URL을 생성한다.
				URL url2 = new URL(apiURL);

				HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();

				conn2.setRequestMethod("POST");
				conn2.setDoOutput(true);

				// 카카오 문서 상에 보면 헤더를 지정하라고 되어있다.
				// 헤더를 지정하는 방법은 아래와 같다.
				conn2.setRequestProperty("Authorization", header);

				res_code = conn2.getResponseCode();
				// System.out.println(res_code+"/"+HttpURLConnection.HTTP_OK);

				if (res_code == HttpURLConnection.HTTP_OK) {
					// 요청에 성공한 경우

					// 카카오 서버쪽에서 사용자의 정보를 보냈다.
					// 이것을 읽어와서 필요한 정보를 얻어내자
					BufferedReader brd = new BufferedReader(new InputStreamReader(conn2.getInputStream()));

					String str = null;
					StringBuffer res = new StringBuffer();
					while ((str = brd.readLine()) != null) {
						res.append(str);
					}

					// 카카오 서버에서 전달되는 모든 값들이
					// res에 누적되어서 저장됐다.
					// System.out.println("res="+res);

					// 받은 값들을 JSON객체로 변환한다.
					obj = parse.parse(res.toString());
					json = (JSONObject) obj;

					// 변환된 JSON객체 안에서 다시
					// JSON객첵체로 얻어내야 하는 것이
					// 바로 "properties"라는 값이다.
					JSONObject props = (JSONObject) json.get("properties");
					String nickname = (String) props.get("nickname");
					
		            json = (JSONObject) obj;
					Object obj3 = json.get("id");
		            String id = obj3.toString();
					 //System.out.println(id);
					String p_img = (String) props.get("profile_image");
					System.out.println(p_img);

					JSONObject kakao_acc = (JSONObject) json.get("kakao_account");
					String email = (String) kakao_acc.get("email");
					JSONObject profile = (JSONObject) kakao_acc.get("profile");
					nickname = (String) profile.get("nickname");
					p_img = (String) profile.get("profile_image_url");

					EvuserVO evo = l_service.getComp(id);
					if (evo == null) {
						if (email == null)	
							email = "evca" + cnt++ + "@";
						evo = new EvuserVO(id, "1111", nickname, email, "010", "salt");
						String comp = SecureUtil.generateSalt();
						evo.setEvu_comp(comp);
						evo.setEvu_pw(SecureUtil.getEncrypt(evo.getEvu_pw(), comp));
						l_service.reg(evo);
					}

					session.setAttribute("mvo", evo);
					session.setAttribute("grade", 1);

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/");
		return mv;
	}
}
