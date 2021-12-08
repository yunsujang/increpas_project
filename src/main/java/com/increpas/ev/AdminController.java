package com.increpas.ev;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/admin")
	public ModelAndView Home() {
		ModelAndView mv = new ModelAndView();
		Object obj = session.getAttribute("uvo");
		if(obj != null) {
			mv.setViewName("mains");
			return mv;
		}
		 
		mv.setViewName("Adminlogin");
		
		return mv;
	}
	
	@RequestMapping("/admin.main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Adminmain");
		return mv;
	}
}
