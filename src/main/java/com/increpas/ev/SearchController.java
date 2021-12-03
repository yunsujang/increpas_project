package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.BbsVO;
import ev.vo.CategoryVO;
import user.service.BbsService;
import user.service.CategoryService;
import user.util.Paging;
import user.util.searchPaging;



@Controller
public class SearchController {
	@Autowired
	CategoryService categoryservice;
	
	@Autowired
	BbsService bbsService;
	
	private String searchValue;
	
	private int nowPage, totalCount, blockList= 12, blockPage = 5;
	
	@RequestMapping(value = "/search",method = RequestMethod.POST)
	public ModelAndView search(String searchValue, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		if(searchValue == null)
			this.searchValue = "";
		
		else
			this.searchValue = searchValue;
		
		if(cPage == null)
			nowPage = 1;
		
		else
			nowPage = Integer.parseInt(cPage);
		
		if(searchValue == null)
			searchValue = "";
		
		//검색결과로 나온 게시물의 수
		totalCount = bbsService.searchTotalCount(searchValue);
		
		searchPaging page = new searchPaging(nowPage, totalCount, blockList, blockPage, this.searchValue);
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		String pageCode = page.getSb().toString();
		
		//페이징 기법을 통해 검색을 통해 테이블에서 가져온 배열 저장
		BbsVO[] search_ar = bbsService.search(searchValue, String.valueOf(begin), String.valueOf(end));
		
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		

		mv.addObject("categoryName_ar", categoryName_ar);
		mv.addObject("search_ar", search_ar);
		mv.addObject("searchValue", searchValue);
		mv.addObject("nowPage", nowPage);
		mv.addObject("totalCount",totalCount );
		mv.addObject("pageCode", pageCode);
		mv.addObject("cPage", cPage);
		mv.setViewName("search");
		
		
		return mv;
	}
}
