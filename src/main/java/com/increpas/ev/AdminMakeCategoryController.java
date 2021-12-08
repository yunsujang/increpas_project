package com.increpas.ev;


import java.util.HashMap;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import admin.service.AdminBbsService;
import admin.service.AdminCategorySerivce;



@Controller
public class AdminMakeCategoryController {

	@Autowired
	AdminCategorySerivce admincategoryservice;
	
	@Autowired
	AdminBbsService adminbbsservice;
	
	
	@ResponseBody
	@RequestMapping(value = "makeCategory", method=RequestMethod.POST)	
		public Map<String, String> makeCategory(String makeName){
		Map<String, String> map = new HashMap<String, String>();
		
		
		String makeCategory = makeName;
		
		System.out.println("컨트롤러"+makeCategory);
		admincategoryservice.makeCategory(makeName);
		map.put("makeName", makeCategory);
			
		return map;
} 
}