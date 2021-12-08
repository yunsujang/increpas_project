package com.increpas.ev;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.BbsVO;
import ev.vo.CategoryVO;
import user.service.BbsService;
import user.service.CategoryService;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	CategoryService categoryservice;
	
	@Autowired
	BbsService bbsService;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		 
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		
		//테이블에 마지막으로 업데이트 된 게시물 3개 가져오기
		BbsVO[]last_ar = bbsService.lastUpdate();
		
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.addObject("last_ar", last_ar);
		mv.setViewName("home");
		return mv;
	}
	
}
