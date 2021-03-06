package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.EvuserVO;
import user.service.LoginService;
import user.util.SecureUtil;

@Controller
public class AdminLoginController {
	
	@Autowired
	LoginService loginservice;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "admin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> adminLogin(String evu_id, String evu_pw) {
		Map<String, String> map = new HashMap<String, String>();
		String str = "";
		String cnt = "1";
		
		EvuserVO evo = loginservice.getComp(evu_id);
		if(evo != null)
			evu_pw = SecureUtil.getEncrypt(evu_pw, evo.getEvu_comp());
		
		EvuserVO vo = loginservice.adminLogin(evu_id, evu_pw);
		if (vo == null) 
			str = "아이디와 비밀번호를 확인해주세요.";

		else if (vo != null && vo.getEvu_who().equals("1")) 
			str = "관리자가 아니므로 입장하실 수 없습니다.";

		else if (vo != null && vo.getEvu_who().equals("0")) {
			session.setAttribute("mvo", vo);
			session.setAttribute("grade", 0);
			str = vo.getEvu_name() + " 관리자님 환영합니다.";
			cnt = "0";
		}

		map.put("str", str);
		map.put("cnt", cnt);
		return map;
	}
	
	//로그아웃 기능
	   @RequestMapping(value = "/adminlogout", method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String, String> adminlogout(){
	      Map<String, String>map = new HashMap<String, String>();
	      session.removeAttribute("mvo");
	      session.removeAttribute("grade");
	      
	      return map;
	   }
}
