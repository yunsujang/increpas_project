package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminMakeUserController {

	
	@ResponseBody
	@RequestMapping(value = "AdminMakeUser", method=RequestMethod.POST)
		public Map<String, String> AdminMakeUser(String name){
		Map<String, String> map = new HashMap<String, String>();
		
		String AdminMakeUser = "관리자 계정이 생성 되었습니다.";
		return map;
	}
}
