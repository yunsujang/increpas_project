package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.dao.AdminUserDAO;
import admin.dao.AdminUserDeletedDAO;
import admin.util.AdminUserSearchPaging;
import ev.vo.EvuserVO;



@Controller
public class AdminUserDeletedSearchController {

	@Autowired
	private AdminUserDeletedDAO u_dao;
	
	private String searchValue;
	
	private int nowPage, totalCount, blockList= 12, blockPage = 5;
	
	@RequestMapping(value = "/admin.deletedusersearch")
	public ModelAndView search(String searchValue, String evu_idx, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		
		if(searchValue == null)
			this.searchValue = "1";
		
		else
			this.searchValue = searchValue;
		
		if(cPage == null)
			nowPage = 1;
		
		else
			nowPage = Integer.parseInt(cPage);
		 
		if(searchValue == null)
			searchValue = "1";
		
		//검색결과로 나온 게시물의 수
		totalCount = u_dao.searchTotalCount(searchValue);
		
		AdminUserSearchPaging page = new AdminUserSearchPaging(nowPage, totalCount, blockList, blockPage, searchValue);
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		String pageCode = page.getSb().toString();
		
		//페이징 기법을 통해 검색을 통해 테이블에서 가져온 배열 저장
		EvuserVO[] search_ar = u_dao.search(searchValue, String.valueOf(begin), String.valueOf(end));

		mv.addObject("search_ar", search_ar);
		mv.addObject("searchValue", searchValue);
		mv.addObject("nowPage", nowPage);
		mv.addObject("totalCount",totalCount );
		mv.addObject("pageCode", pageCode);
		mv.addObject("cPage", cPage);
		mv.setViewName("AdminUserDeletedSearch"); 
		
		
		return mv;
	}

}
