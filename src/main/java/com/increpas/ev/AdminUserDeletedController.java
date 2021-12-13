package com.increpas.ev;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import admin.dao.AdminUserDeletedDAO;
import admin.util.BbsPaging;
import ev.vo.BbsVO;
import ev.vo.EvuserVO;

@Controller
public class AdminUserDeletedController {
	
	@Autowired
	private AdminUserDeletedDAO u_dao;
	
	int nowPage;
	int deletedtotalCount;
	int blockList = 20; // 한 페이지당 표현될 게시물 수
	int blockPage = 5;// 한 블럭당 표현될 페이지 수


	
	@RequestMapping("/admin.deleteduser")
	public ModelAndView user(String cPage) {
		ModelAndView mv = new ModelAndView();
		
		if (cPage == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(cPage);

		deletedtotalCount = u_dao.deletedtotalCount();

		// 페이징 처리를 위한 객체 생성
		BbsPaging page = new BbsPaging(nowPage, deletedtotalCount, blockList, blockPage);

		int begin = page.getBegin();
		int end = page.getEnd();

		EvuserVO[] ar = u_dao.getList(begin, end);
		
		
		
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("blockList", blockList);
		mv.addObject("deletedtotalCount", deletedtotalCount);
		mv.addObject("pageCode", page.getSb().toString());
		mv.setViewName("AdminUserDeleted");
		
		return mv;
		
	}
	

}
