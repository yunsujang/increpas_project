package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.dao.AdminUserDAO;

@Controller
public class AdminDeleteUserController {
	
	@Autowired
	private AdminUserDAO u_dao;
	
	@RequestMapping("/admin.deleteUser")
	public String del(String evu_idx) {
		u_dao.deleteUser(evu_idx);  
		return "redirect:/admin.user"; 
	}

}
