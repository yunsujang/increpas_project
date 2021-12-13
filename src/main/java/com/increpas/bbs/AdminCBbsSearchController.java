package com.increpas.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.vo.BbsVO;
import user.dao.UserBbsDAO;
import user.service.UserBbsService;
import user.util.UserBbsPaging;
import user.util.UserBbsSearchPaging;


@Controller
public class AdminCBbsSearchController {

	@Autowired
	private UserBbsDAO b_dao;
	
	@Autowired
	UserBbsService userService;
	
	
	private String searchValue;
	
	int nowPage;
	int rowTotal;
	int blockList = 10; //한 페이지당 표현될 게시물 수
	int blockPage = 5;//한 블럭당 표현될 페이지 수
	 
	
	
	@RequestMapping(value="/admin.search.ev")
	public ModelAndView search(String cPage, String evcbbs_idx,String searchValue) {
		ModelAndView mv = new ModelAndView();
		
		if(searchValue == null)
			this.searchValue = "1";
		else
			this.searchValue= searchValue;
		
		if(cPage == null)
			nowPage = 1;//현재 페이지 값
		else
			nowPage = Integer.parseInt(cPage);
		
		if(searchValue == null)
			searchValue = "1";
		
		
		rowTotal = userService.searchTotalCount(searchValue);//전체 게시물 수
		
		//페이징 처리를 위한 객체 생성
		UserBbsSearchPaging page = new UserBbsSearchPaging(nowPage, rowTotal, blockList, blockPage , searchValue);
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		BbsVO[] ar = userService.search(searchValue,String.valueOf(begin), String.valueOf(end));
	
		//JSP에서 표현해야 하므로 ar을 mv에 저장한다.
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("searchValue", searchValue);
		mv.addObject("blockList", blockList);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("pageCode", page.getSb().toString());
	
		mv.setViewName("adminEvSearch");// views/list.jsp
		
		return mv;
	}
	
}
