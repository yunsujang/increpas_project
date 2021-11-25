package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import user.service.BbsService;
import user.service.CategoryService;
import user.vo.BbsVO;
import user.vo.CategoryVO;

@Controller
public class ViewController {
	@Autowired
	BbsService bbsService;
	
	@Autowired
	CategoryService categoryservice;
	
	@RequestMapping("/view")
	public ModelAndView view(String evbbs_idx ,String cPage) {
		ModelAndView mv = new ModelAndView();
		
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		
		//사용자가 클릭한 게시물 가져오기
		BbsVO vo = bbsService.getBbs(evbbs_idx);
		
		//사용자가 클릭한 게시물의 이전 게시물 가져오기
		int num = Integer.parseInt(evbbs_idx);
		int preidx = num-1; 
		if(preidx >1) {
			preidx--;
			BbsVO prevo = bbsService.getBbs(String.valueOf(preidx));
			mv.addObject("prevo", prevo);
		}
		
		//사용자가 클릭한 게시물의 다음 게시물 가져오기
		int nextidx = num+1;
		BbsVO nextvo = bbsService.getBbs(String.valueOf(nextidx));
		
		mv.addObject("nextvo", nextvo);
		mv.addObject("vo", vo);
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.addObject("cPage", cPage);
		mv.setViewName("view");
		
		return mv;
	}
	
	
	
}
