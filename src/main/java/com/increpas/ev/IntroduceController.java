package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.CategoryVO;
import user.service.CategoryService;

@Controller
public class IntroduceController {
	
	@Autowired
	CategoryService categoryservice;
	
	@RequestMapping("introduce")
	public ModelAndView introduce() {
		ModelAndView mv = new ModelAndView();
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("introduce");
		return mv;
	}
}
