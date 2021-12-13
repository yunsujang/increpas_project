package com.increpas.bbs;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.CategoryVO;
import mybatis.vo.BbsVO;
import mybatis.vo.CommentVO;
import user.dao.UserBbsDAO;
import user.service.CategoryService;
import user.service.UserBbsService;
import user.util.CSSFont;

@Controller
public class AdminCBbsViewController {
	
	List<BbsVO> r_list;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private UserBbsDAO b_dao;
	
	@Autowired
	UserBbsService userService;
	
	@Autowired
	private CategoryService categoryservice;
	
	
	@Autowired
	private HttpServletRequest request;
	 
	
	//조회수 중복확인//////
		public boolean checkBbs(BbsVO vo){
			boolean value = true;
			for(BbsVO bvo : r_list){
				if(bvo.getEvcbbs_idx().equals(vo.getEvcbbs_idx())){
					value = false;
					break;
				}
			}
			return value;
		}
	
	
	@RequestMapping("/admin.view.ev")
	public ModelAndView view(String evcbbs_idx, String cPage, String evccomment_idx) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("read_list");
		
		
		if(obj == null) {
			r_list = new ArrayList<BbsVO>();
			session.setAttribute("read_list", r_list);
		}else {
			r_list = (ArrayList<BbsVO>)obj;
		}
		
		BbsVO vo2 =userService.getBbs(evcbbs_idx);
			
			//위에서 검색된 BbsVO가 이전에 한번이라도 읽었던 것이라는
			// 반드시 read_list(r_list)에 저장되었을 것이다.
			if(checkBbs(vo2)) {
			//한번도 읽지 않은 게시물이므로 hit수를 증가시킨 후
			// r_list에 추가
				userService.updateHit(evcbbs_idx);
			r_list.add(vo2);
		}
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();	
		int cnt = 0;
		if(categoryName_ar != null) 
			cnt = categoryName_ar.length;
		StringBuffer sb = CSSFont.StyleCode(2,cnt);
	
		BbsVO vo = userService.getBbs(evcbbs_idx);
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.addObject("sb",sb);	
		mv.addObject("vo", vo);
		mv.addObject("ip", request.getRemoteAddr());
		//cPage도 사실 가야 하는데... 저장할 필요는 없다.
		//이유는 view.jsp로 forward되므로 여기까지 전달된 
		//파라미터들이 모두 같이 가게된다.
		mv.setViewName("adminEvView");
		mv.addObject("vo2", vo2);
		
		
		return mv;
	}
}
