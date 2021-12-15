package com.increpas.ev;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.dao.AdminUserDAO;
import admin.service.AdminUserService;
import admin.util.BbsPaging;
import ev.vo.EvuserVO;

@Controller
public class AdminUserController {
	
	@Autowired
	private AdminUserDAO u_dao;
	
	@Autowired
	private AdminUserService u_service;
	
	int nowPage;
	int totalCount;
	int blockList = 20; // 한 페이지당 표현될 게시물 수
	int blockPage = 5;// 한 블럭당 표현될 페이지 수


	
	@RequestMapping("/admin.user")
	public ModelAndView user(String cPage) {
		ModelAndView mv = new ModelAndView();
		
		if (cPage == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(cPage);

		totalCount = u_dao.totalCount();

		// 페이징 처리를 위한 객체 생성
		BbsPaging page = new BbsPaging(nowPage, totalCount, blockList, blockPage);

		int begin = page.getBegin();
		int end = page.getEnd();

		EvuserVO[] ar = u_dao.getList(begin, end);
		
		
		
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("blockList", blockList);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageCode", page.getSb().toString());
		mv.setViewName("AdminUser");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/gradeChange", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> gradeChange(String idx, String who){
		Map<String, String>map = new HashMap<String, String>();
		String code = "";
		if(who.equals("0"))
			who = "1";
		else if(who.equals("1"))
			who = "0";
		
		int cnt = u_service.gradeChange(who, idx);
		if(cnt > 0)
			code = "등급이 변경되었습니다.";
		
		map.put("code", code);
		return map;
	}
	

}
