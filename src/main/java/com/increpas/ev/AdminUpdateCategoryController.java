package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminBbsService;
import admin.service.AdminCategoryService;

@Controller
public class AdminUpdateCategoryController {

	@Autowired
	AdminCategoryService admincategoryservice;
	
	@Autowired
	AdminBbsService adminbbsservice;
	
	
	@ResponseBody
	@RequestMapping(value = "updateCategory", method=RequestMethod.POST)
	public Map<String, String> updateCategory(@RequestBody Map<String,Object> param){

	
		String changeCategory = (String) param.get("changeName");
		String msg ="예외상황 발생";
		
		//게시판 중복 체크
		int categoryCheck = admincategoryservice.updateCategoryCheck(changeCategory);
		
		if(categoryCheck < 1) {
			admincategoryservice.updateCategory(param);
			msg="게시판명이 [" +changeCategory+ "] 으로 수정 되었습니다.";
		}else {
			System.out.println("중복된게시판명 있음");
			msg="게시판 명 중복";
		}
		Map<String, String>map = new HashMap<String, String>();
		map.put("msg", msg);
		 
		
		
	return map;
	}
	
}
