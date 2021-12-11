package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.dao.AdminEvbbsDAO;

@Controller
public class AdminBbsDeleteController {
	
	@Autowired
	private AdminEvbbsDAO bbs_dao;
	
	@RequestMapping("/admin.del")
	public String del(String evbbs_idx) {
		bbs_dao.delBbs(evbbs_idx);  
		return "redirect:/admin.bbsList"; 
	} 

}
