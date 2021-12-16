package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminUserService;
import user.util.SecureUtil;

@Controller
public class AdminMakeUserController {

	@Autowired
	AdminUserService adminuserservice;
	
	@ResponseBody
	@RequestMapping(value = "AdminMakeUser", method=RequestMethod.POST)
		public Map<String, String> AdminMakeUser(String makeId, String makePw, String makeName){
		Map<String, String> map = new HashMap<String, String>();
		
		String AdminMakeUser = makeName+" 관리자 계정이 생성 되었습니다.";
		int cnt = adminuserservice.AdminMakeUserCheck(makeId);
		if(cnt <= 0){
			String comp = SecureUtil.generateSalt();
			makePw = SecureUtil.getEncrypt(makePw, comp);
			adminuserservice.AdminMakeUser(makeId, makePw, makeName,comp);
		}
		
		else {
			AdminMakeUser = "이미 사용중인 아이디 입니다.";
		}
		map.put("makeId", AdminMakeUser);
		map.put("makePw", AdminMakeUser);
		map.put("makeName", AdminMakeUser);
		return map;
	}
	
}
