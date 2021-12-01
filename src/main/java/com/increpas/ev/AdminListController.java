package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.dao.AdminEvbbsDAO;
import admin.util.BbsPaging;
import ev.vo.BbsVO;

@Controller
public class AdminListController {
	
	@Autowired
	private AdminEvbbsDAO b_dao;
	
	int nowPage;
	int totalCount;
	int blockList = 20; //한 페이지당 표현될 게시물 수
	int blockPage = 5;//한 블럭당 표현될 페이지 수
		
	@RequestMapping("/admin.bbsList")
	public ModelAndView list(String cPage) {
		ModelAndView mv = new ModelAndView();
		
		if(cPage == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(cPage);
		
		totalCount = b_dao.totalCount();
		
		//페이징 처리를 위한 객체 생성
		BbsPaging page = new BbsPaging(nowPage, totalCount, blockList, blockPage);
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		BbsVO[] ar = b_dao.getList(begin, end);
		
		//JSP에서 표현해야 하므로 ar을 mv에 저장한다.
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("blockList", blockList);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageCode", page.getSb().toString());
		
		mv.setViewName("AdminbbsList");
		
		return mv;
	}
}
