package com.increpas.ev;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@RequestMapping("/admin")
	public String Home() {
		return "Adminlogin";
		
	}
	
	@RequestMapping("/admin.main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Adminmain");
		return mv;
	}
}
