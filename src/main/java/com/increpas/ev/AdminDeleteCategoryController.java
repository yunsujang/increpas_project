package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminBbsService;
import admin.service.AdminCategorySerivce;

@Controller
public class AdminDeleteCategoryController {
	
	@Autowired
	AdminCategorySerivce admincategoryservice;
	
	@Autowired
	AdminBbsService adminbbsservice;
	
	
	@ResponseBody
	@RequestMapping(value = "deleteCategory", method = RequestMethod.POST)
	public Map<String, String> deleteCategory(String name){
		Map<String, String>map = new HashMap<String, String>();
		String deleteName = name;
		int i = admincategoryservice.deleteCategory(name);
		if( i > 0) {
			map.put("deleteName", deleteName);
		}
		
		return map;
	}
}
