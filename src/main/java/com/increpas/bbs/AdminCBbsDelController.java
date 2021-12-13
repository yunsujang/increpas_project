package com.increpas.bbs;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import user.dao.UserBbsDAO;
import user.service.UserBbsService;

@Controller
public class AdminCBbsDelController {

	@Autowired
	private UserBbsDAO b_dao;
	
	@Autowired
	UserBbsService userService;
	//게시물 삭제 
	@RequestMapping("/admin.delete.ev")
	public String del(String evcbbs_idx, String cPage) {
		b_dao.delBbs(evcbbs_idx);  
		userService.delBbs(evcbbs_idx);
		//System.out.println(evcbbs_idx+"/"+cPage); 
		return "redirect:/admin.list.ev?cPage="+cPage;
		 
	}
	//댓글삭제
	@RequestMapping(value="/admin.commDel.ev",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> commDel(String idx) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		
		//int i = b_dao.commDel(idx);
		int i = userService.commDel(idx);
		map.put("code", String.valueOf(i));
		
		//System.out.println(idx);
		return map;
	}
	
	
}
