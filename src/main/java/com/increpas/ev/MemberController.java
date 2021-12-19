package com.increpas.ev;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.CategoryVO;
import ev.vo.EvuserVO;
import user.service.CategoryService;
import user.service.MemberService;
import user.util.SecureUtil;

@Controller
public class MemberController {

	@Autowired
	HttpSession session;
	
	@Autowired
	MemberService m_service;
	
	@Autowired
	CategoryService categoryservice;
	
	//1.회원정보 
	@RequestMapping("mypage")
	public ModelAndView memberList() {
		ModelAndView mv = new ModelAndView();
		Object obj = session.getAttribute("mvo");
			EvuserVO evo = (EvuserVO) obj;
			
			//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
			CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
			
			mv.addObject("categoryName_ar", categoryName_ar);
			mv.addObject("evo", evo);

			mv.setViewName("member_list");
		return mv;
		
	}
	
	@RequestMapping(value="/deletecheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> deletecheck(String usedpwd){
		Map<String, String>map = new HashMap<String, String>();
		Object obj = session.getAttribute("mvo");
		EvuserVO evo = (EvuserVO) obj;
		String comp = evo.getEvu_comp();
		String rpw = SecureUtil.getEncrypt(usedpwd, comp);
		String code= "1";
		if(rpw.equals(evo.getEvu_pw()))
			code = "0";
		
		map.put("code", code);
		
		
		return map;
	}
	
	@RequestMapping(value="/userDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> userDelete(){
		Map<String, String>map = new HashMap<String, String>();
		Object obj = session.getAttribute("mvo");
		EvuserVO evo = (EvuserVO) obj;
		String idx = evo.getEvu_idx();
		
		int cnt = m_service.deleteMember(idx);
		if(cnt > 0) {
			String code = "탈퇴되었습니다.";
			map.put("code", code);
			session.removeAttribute("mvo");
		}
		
		return map;
	}
	
	
	//회원정보 수정
	@RequestMapping("/userModify")
	public ModelAndView memberModi() {
		ModelAndView mv = new ModelAndView();
		Object obj = session.getAttribute("mvo");
		EvuserVO evo = (EvuserVO) obj;
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		
		mv.addObject("categoryName_ar", categoryName_ar);
		
		mv.addObject("evo",evo);
		mv.setViewName("member_view");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public ModelAndView update(EvuserVO vo) {
	ModelAndView mv = new ModelAndView();
	
	Object obj = session.getAttribute("mvo");
	EvuserVO evo = (EvuserVO)obj;
	
	vo.setEvu_idx(evo.getEvu_idx());
	System.out.println(vo.getEvu_id()+"/"+vo.getEvu_name()+"/"+vo.getEvu_idx());
	
	
	m_service.modiMember(vo);
	session.setAttribute("mvo", vo);
	mv.addObject("vo",vo);
	mv.setViewName("redirect:/mypage");
	
	
	return mv;
}
	
}
	
	
	
	
	

