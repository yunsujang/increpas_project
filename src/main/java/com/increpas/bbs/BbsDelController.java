package com.increpas.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import user.dao.UserBbsDAO;

@Controller
public class BbsDelController {

	@Autowired
	private UserBbsDAO b_dao;
	
	@RequestMapping("/delete.ev")
	public String del(String evcbbs_idx, String cPage) {
		b_dao.delBbs(evcbbs_idx);  
		//System.out.println(evbbs_idx+"/"+cPage); 
		return "redirect:/list.ev?cPage="+cPage;
	}
}
