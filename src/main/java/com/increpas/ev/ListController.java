package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.BbsVO;
import ev.vo.CategoryVO;
import user.service.BbsService;
import user.service.CategoryService;
import user.util.Paging;

@Controller
public class ListController {
	
	@Autowired
	CategoryService categoryservice;
	
	@Autowired
	BbsService bbsService;
	
	private int nowPage, totalCount, blockList= 12, blockPage = 5;
	
	@RequestMapping("/category")
	public ModelAndView next(String evcategory_idx,String cPage) {
		ModelAndView mv = new ModelAndView();
		
		//처음 이동 시 cPage값은 null이므로 1을 넣어줘서 첫페이로 향하도록 해준다.
		if(cPage == null)
			nowPage = 1;
		
		//이후 인자로 받는 cPage값을 멤버변수인 nowPage에 넣어준다.
		else
			nowPage = Integer.parseInt(cPage);
		
		//사용자가 evcategory_idx값을 입력하지 않았을 시 첫번째 게시판으로 향한다.
		if(evcategory_idx == null)
			evcategory_idx = "1";
		
		//페이징 기법을 위해 총 게시물 수를 구해준다.
		totalCount = bbsService.totalCount(evcategory_idx);
		
		//페이징 객체 생성
		Paging page = new Paging(nowPage, totalCount, blockList, blockPage);
		
		  
		int begin = page.getBegin();
		int end = page.getEnd();
		
		
		String pageCode = page.getSb().toString();
		
		//페이징 기법을 통해 테이블에서 가져온 배열 저장
		BbsVO[] paging_ar = bbsService.paging(evcategory_idx, String.valueOf(begin), String.valueOf(end));
		
		
		CategoryVO nowCategory = categoryservice.nowCategory(evcategory_idx);
		
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		
		//페이징 배열
		mv.addObject("paging_ar", paging_ar);
		
		//현재 페이지
		mv.addObject("nowPage", nowPage);
		
		//보여질 게시물 수
		mv.addObject("blockList", blockList);
		
		//총 게시물 수
		mv.addObject("totalCount",totalCount );
		
		// 페이징 기법으로 만들어진 페이지번호 태그
		mv.addObject("pageCode", pageCode);
		
		
		mv.addObject("nowCategory", nowCategory);
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("category");
		return mv;
	}

}
