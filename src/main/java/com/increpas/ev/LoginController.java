package com.increpas.ev;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
	private CategoryService categoryservice;

	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping("/reg")
	public ModelAndView reg() {
		ModelAndView mv = new ModelAndView();
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("reg");
		return mv;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> logout(){
		Map<String, String>map = new HashMap<String, String>();
		session.removeAttribute("mvo");
		
		return map;
	}
	
	
	
	
	
//	@RequestMapping(value = "/login",method = RequestMethod.POST)
//	public ModelAndView login(MemVO vo) {
//		ModelAndView mv = new ModelAndView();
//		MemVO mvo = l_service.login(vo.getEvu_id(),vo.getEvu_pw());
//		
//		mv.addObject("mvo", mvo); 	
//		mv.setViewName("home");	
//		return mv;
//	}
	
/*	@RequestMapping(value = "/login",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> login(String evu_id, String evu_pw){
		Map<String, String>map = new HashMap<String, String>();
		System.out.println("id : " + evu_id+"pw :" + evu_pw);
		String name = "abc";
		EvuserVO mvo = l_service.login(evu_id, evu_pw);
		session.setAttribute("mvo", mvo);			
		return map;
	}
	*/
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ModelAndView login(String evu_id, String evu_pw) {
		ModelAndView mv = new ModelAndView();
		EvuserVO uvo = l_service.getComp(evu_id);
		String realPassword = SecureUtil.getEncrypt(evu_pw, uvo.getEvu_comp());
		EvuserVO mvo = l_service.login(evu_id, realPassword);
		session.setAttribute("mvo", mvo);	
		
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
	
	
	//sting은 그냥 jsp로 이동할떄 
	//modelandview는 어떤 값을 받아서 보낼떄
	//Map은 테이블에 갔다와서 값을 전달할떄 map.putㅇ르
	
	@RequestMapping(value = "/reg",method = RequestMethod.POST)
	public ModelAndView reg(EvuserVO vo) {
		ModelAndView mv = new ModelAndView();
		System.out.println(vo.getEvu_id());
		String comp = SecureUtil.generateSalt();
		vo.setEvu_comp(comp);
		vo.setEvu_pw(SecureUtil.getEncrypt(vo.getEvu_pw(), comp));
		int i = l_service.reg(vo);
		if(i > 0) {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@RequestMapping(value="/idcheck",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> regcheck(String id){
		Map<String, Integer>map = new HashMap<String, Integer>();
		System.out.println("아이디 : "+id);
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
		map.put("rnum", srnum);
		return map;
	}
}
