package com.increpas.ev;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.dao.AdminUserDeletedDAO;

@Controller
public class AdminRecoveryUserController {
	
	@Autowired
	private AdminUserDeletedDAO u_dao;
	
	@RequestMapping("/admin.recoveryUser")
	public String recovery(String evu_idx) {
		u_dao.recoveryUser(evu_idx);  
		return "redirect:/admin.deleteduser"; 
	}

}
