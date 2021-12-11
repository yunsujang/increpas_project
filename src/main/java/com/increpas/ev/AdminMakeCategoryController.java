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
		
		String makeCategory = makeName+" 게시판이 생성되었습니다.";
		int cnt = admincategoryservice.makeCategoryCheck(makeName);
		if(cnt <= 0) {
			admincategoryservice.makeCategory(makeName);
		}
		
		else {
			makeCategory = "중복된 값이 있습니다.";
		}
		map.put("makeName", makeCategory);
			
		return map;
	} 
	
}