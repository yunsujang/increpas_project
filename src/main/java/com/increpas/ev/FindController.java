package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.CategoryVO;
import ev.vo.EvuserVO;
import user.service.CategoryService;
import user.service.LoginService;
import user.util.SecureUtil;

@Controller
public class FindController {

	@Autowired
	CategoryService categoryservice;

	@Autowired
	LoginService l_service;

	@RequestMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView();

		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();

		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("find");

		return mv;
	}

	@RequestMapping(value = "findId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String[]> findId(String name, String email) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		EvuserVO[] evo = l_service.findId(name, email);
		String[] ok = { "1" };
		String[] code = { "해당하는 아이디가 없습니다." };
		String[] str = { "" };
		int cnt = 0;
		int i = 0;
		if (evo != null) {
			ok[0] = "0";
			code = new String[evo.length];
			str[0] = String.valueOf(evo.length);
			for (EvuserVO vo : evo) {
				cnt = vo.getEvu_id().length();
				code[i] = vo.getEvu_id().substring(0, cnt - 2) + "**";
				i++;
			}
		}

		map.put("ok", ok);
		map.put("str", str);
		map.put("code", code);
		return map;
	}

	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> findPw(String id, String email) {
		Map<String, String> map = new HashMap<String, String>();
		EvuserVO evo = l_service.findPw(id, email);
		String cnt = "1";
		if (evo != null) {
			cnt = "0";
		}
		map.put("cnt", cnt);
		return map;
	}
	
	@RequestMapping(value = "changePw", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> changePw(String id,String pw) {
		Map<String, String> map = new HashMap<String, String>();
		String code = "1";
		EvuserVO evo = l_service.getComp(id);
		pw = SecureUtil.getEncrypt(pw, evo.getEvu_comp());
		int cnt = l_service.changePw(id, pw);
		if(cnt > 0)
			code = "0";
		
		map.put("code", code);
		return map;
	}
	
}
