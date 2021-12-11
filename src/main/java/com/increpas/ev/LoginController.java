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

import admin.service.AdminCategorySerivce;
import ev.vo.CategoryVO;
import ev.vo.EvuserVO;
import user.service.CategoryService;
import user.service.LoginService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
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
		EvuserVO mvo = l_service.login(evu_id, evu_pw);
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
		int i = l_service.reg(vo.getEvu_id(), vo.getEvu_pw() ,vo.getEvu_name(),vo.getEvu_email(),vo.getEvu_phone());
		if(i > 0) {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
}
