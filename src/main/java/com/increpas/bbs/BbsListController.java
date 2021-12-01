package com.increpas.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.vo.BbsVO;
import user.dao.UserBbsDAO;
import user.util.UserBbsPaging;

@Controller
public class BbsListController {

	@Autowired
	private UserBbsDAO b_dao;
	
	int nowPage;
	int rowTotal;
	int blockList = 15; //한 페이지당 표현될 게시물 수
	int blockPage = 5;//한 블럭당 표현될 페이지 수
		
	@RequestMapping("/list.ev")
	public ModelAndView list(String cPage, String evcategory_idx) {
		ModelAndView mv = new ModelAndView();
		
		if(cPage == null)
			nowPage = 1;//현재페이지 값
		else
			nowPage = Integer.parseInt(cPage);
		
		if(evcategory_idx == null)
			evcategory_idx = "1";//일반 게시판
		
		rowTotal = b_dao.getTotalCount(evcategory_idx);//전체 게시물 수
		
		//페이징 처리를 위한 객체 생성
		UserBbsPaging page = new UserBbsPaging(nowPage, rowTotal, blockList, blockPage);
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		BbsVO[] ar = b_dao.getList(begin, end, evcategory_idx);
	
		//JSP에서 표현해야 하므로 ar을 mv에 저장한다.
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("blockList", blockList);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("pageCode", page.getSb().toString());
	
		mv.setViewName("evList");// views/list.jsp
		
		return mv;
	}
		
		
	
	
}







