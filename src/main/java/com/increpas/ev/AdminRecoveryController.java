package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.service.AdminBbsService;
import admin.service.AdminCategorySerivce;
import admin.util.categoryRecoveryPaging;
import ev.vo.CategoryVO;

@Controller
public class AdminRecoveryController {
	
	private int nowPage, totalCount, blockList= 10, blockPage = 5;
	
	@Autowired
	AdminCategorySerivce admincategoryservice;
	
	@Autowired
	AdminBbsService adminbbsservice;
	
	@RequestMapping("/admin.CategoryRecovery")
	public ModelAndView recoveryHome(String cPage) {
	ModelAndView mv = new ModelAndView();
		
		//페이징 기법을 위해 총 게시물 수를 구해준다.
		totalCount = admincategoryservice.deleteTotalCount();

		//처음 이동 시 cPage값은 null이므로 1을 넣어줘서 첫페이지로 향하도록 해준다.
		if(cPage == null)
			nowPage = 1;
		
		//이후 인자로 받는 cPage값을 멤버변수인 nowPage에 넣어준다.
		else
			nowPage = Integer.parseInt(cPage);
		
		//페이징 객체 생성
		categoryRecoveryPaging page = new categoryRecoveryPaging(nowPage, totalCount, blockList, blockPage);
		
		  
		int begin = page.getBegin();
		int end = page.getEnd();
		
		
		String pageCode = page.getSb().toString();
		
		//페이징 기법을 통해 테이블에서 가져온 배열 저장
		CategoryVO[] cvo = admincategoryservice.getRecoveryCategoryList(String.valueOf(begin), String.valueOf(end));
		
		//페이징 배열
		mv.addObject("cvo", cvo);
		
		//현재 페이지
		mv.addObject("nowPage", nowPage);
		
		//보여질 게시물 수
		mv.addObject("blockList", blockList);
		
		//총 게시물 수
		mv.addObject("totalCount",totalCount );
		
		// 페이징 기법으로 만들어진 페이지번호 태그
		mv.addObject("pageCode", pageCode);
		
		mv.setViewName("AdminCategoryRecovery");
		return mv;
	}
	
	
	@RequestMapping(value = "/recoveryCategory",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> recoveryCategory(String name){
		System.out.println(name);
		Map<String, String>map = new HashMap<String, String>();
		String recoveryName = name;
		String idx = admincategoryservice.getCategoryidx(name);
		System.out.println(idx);
		int cnt = adminbbsservice.ajaxTotalList2(idx);
		if(cnt > 0)
			adminbbsservice.AdminRecoveryBbs(idx);
		
		admincategoryservice.RecoveryCategory(name);
		
		map.put("recoveryName", recoveryName);
		
		return map;
	}

}
