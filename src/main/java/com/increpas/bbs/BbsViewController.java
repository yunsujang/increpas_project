package com.increpas.bbs;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.vo.BbsVO;
import user.dao.UserBbsDAO;

@Controller
public class BbsViewController {
	
	List<BbsVO> r_list;
	
	
	@Autowired
	private UserBbsDAO b_dao;
	
	@Autowired
	private HttpServletRequest request;
	
	
	//조회수 중복확인//////
		public boolean checkBbs(BbsVO vo){
			boolean value = true;
			
			for(BbsVO bvo : r_list){
				if(bvo.getEvbbs_idx().equals(vo.getEvbbs_idx())){
					value = false;
					break;
				}
			}
			return value;
		}
	
	
	@RequestMapping("/view.ev")
	public ModelAndView view(String evbbs_idx, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("read_list");
		
		
		if(obj == null) {
			r_list = new ArrayList<BbsVO>();
			session.setAttribute("read_list", r_list);
		}else {
			r_list = (ArrayList<BbsVO>)obj;
		}
		
		BbsVO vo2 =b_dao.getBbs(evbbs_idx);
			
			//위에서 검색된 BbsVO가 이전에 한번이라도 읽었던 것이라는
			// 반드시 read_list(r_list)에 저장되었을 것이다.
			if(checkBbs(vo2)) {
			//한번도 읽지 않은 게시물이므로 hit수를 증가시킨 후
			// r_list에 추가
			b_dao.updateHit(evbbs_idx);
			r_list.add(vo2);
		}
		
		
		BbsVO vo = b_dao.getBbs(evbbs_idx);
		mv.addObject("vo", vo);
		mv.addObject("ip", request.getRemoteAddr());
		//cPage도 사실 가야 하는데... 저장할 필요는 없다.
		//이유는 view.jsp로 forward되므로 여기까지 전달된 
		//파라미터들이 모두 같이 가게된다.
		mv.setViewName("evView");
		mv.addObject("vo2", vo2);
		
		return mv;
	}
}