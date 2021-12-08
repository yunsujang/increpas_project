package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.CategoryVO;
import user.service.CategoryService;

@Controller
public class CommunityController {

	@Autowired
	CategoryService categoryservice;
	
	@RequestMapping("/community")
	public ModelAndView community() {
		ModelAndView mv = new ModelAndView();
		 
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("community");
		return mv;
	}
}
