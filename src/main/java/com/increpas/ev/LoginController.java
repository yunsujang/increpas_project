package com.increpas.ev;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.CategoryVO;
import ev.vo.EvuserVO;
import spring.service.MailService;
import user.service.CategoryService;
import user.service.LoginService;
import user.util.SecureUtil;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

	@Autowired
	private MailService mailService; //인자로 들어오도록 해준다.
	
	@Autowired
	LoginService l_service;

	@Autowired
	HttpSession session;
	
	@Autowired
	ServletRequest request;
	@Autowired
	private CategoryService categoryservice;
	
	//헤더에서 로그인 클릭 시 로그인 화면으로 이동
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("login");
		return mv;
	}
	
	//헤더에서 회원가입 클릭 시 회원가입 화면으로 이동
	@RequestMapping("/reg")
	public ModelAndView reg() {
		ModelAndView mv = new ModelAndView();
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("reg");
		return mv;
	}
	
	//로그아웃 기능
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> logout(){
		Map<String, String>map = new HashMap<String, String>();
		session.removeAttribute("mvo");
		session.removeAttribute("grade");
		
		return map;
	}
	
	//일반 로그인 버튼 클릭시 수행되는 기능
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> login(String evu_id, String evu_pw) {
		Map<String, String>map = new HashMap<String, String>();
		EvuserVO uvo = l_service.getComp(evu_id);
		String m = "0"; 
		if(uvo == null) {
			m = "1";
		}
		else {
			String realPassword = SecureUtil.getEncrypt(evu_pw, uvo.getEvu_comp());
			EvuserVO mvo = l_service.login(evu_id, realPassword);
			if(mvo == null)
				m = "1";
			else
				session.setAttribute("mvo", mvo);	
				session.setAttribute("grade", 0);
		}
		map.put("m", m);
		return map;
	}
	
	//회원가입 버튼 클릭시 수행되는 기능
	@RequestMapping(value = "/reg",method = RequestMethod.POST)
	public ModelAndView reg(EvuserVO vo) {
		ModelAndView mv = new ModelAndView();
		String comp = SecureUtil.generateSalt();
		vo.setEvu_comp(comp);
		vo.setEvu_pw(SecureUtil.getEncrypt(vo.getEvu_pw(), comp));
		int i = l_service.reg(vo);
		if(i > 0) {
			mv.setViewName("redirect:/login");
		}
		return mv;
	}
	
	//중복된 아이디 검사
	@RequestMapping(value="/idcheck",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> regcheck(String id){
		Map<String, Integer>map = new HashMap<String, Integer>();
		int code = 0;
		
		EvuserVO vo = l_service.getComp(id);
		if(vo != null)
			code = 1;
		
		map.put("code",code);
		
		return map;
	}
	
	//메일 발송
	@RequestMapping(value="/sendMail", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> sendEmail(String email) throws Exception{
		Map<String, String>map = new HashMap<String, String>();
		int rnum = (int)(Math.random()*9999 + 1000);
		String srnum = String.valueOf(rnum);
		String fromAddr = "rndurdk2@gmail.com";
		String subject = "[evca]인증번호 메일입니다.";
		
		String body = "안녕하세요? evca입니다.\r\n 인증번호는 "+rnum+" 입니다.";
		mailService.sendMail(email, fromAddr, subject, body);//받는이 보낸이 제목 내용
		map.put("str", "발송완료");
		session.setAttribute("srnum", srnum);
		return map;
	}
	
	@RequestMapping(value="/getcode", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> getCert(){
		Map<String, String>map = new HashMap<String, String>();
		String code ="인증번호를 발송하세요.";
		Object obj = session.getAttribute("srnum");
		
		if(obj != null) {
		code = (String)obj;
		}
		
		map.put("code", code);
		return map;
	}
	
	@RequestMapping(value="/setSuccess", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> setSuccess(){
		Map<String, String>map = new HashMap<String, String>();
		String ok ="0";
		session.setAttribute("ok", ok);
		return map;
	}
	
	@RequestMapping(value="/getSuccess", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> getSuccess(){
		Map<String, String>map = new HashMap<String, String>();
		String code = "1";
		Object obj = session.getAttribute("ok");
		if(obj != null)
			code = (String)obj;
		
		map.put("code", code);
		return map;
	}
	
	@RequestMapping(value="/finish", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> finish(){
		Map<String, String>map = new HashMap<String, String>();
		session.removeAttribute("srnum");
		session.removeAttribute("ok");
		return map;
	}
	
}
