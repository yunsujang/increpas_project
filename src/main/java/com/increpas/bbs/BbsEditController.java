package com.increpas.bbs;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ev.vo.CategoryVO;
import mybatis.vo.BbsVO;
import user.dao.UserBbsDAO;
import user.service.CategoryService;
import user.service.UserBbsService;
import user.util.CSSFont;
import user.util.FileRenameUtil;

@Controller
public class BbsEditController {

	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	
	@Autowired
	UserBbsService userService;
	
	
	@Autowired
	private CategoryService categoryservice;
	
	@Autowired
	private UserBbsDAO b_dao;
	 
	private String editor_img = "/resources/editor_img";
	private String bbs_upload = "/resources/bbs_upload";
	
	@RequestMapping("/edit.ev")
	//public ModelAndView edit(String evcbbs_idx) {
	public String edit(String evcbbs_idx, Model m) {
		/*
		ModelAndView mv = new ModelAndView();
		
		BbsVO2 vo = b_dao.getBbs(evcbbs_idx);
		mv.addObject("vo", vo);// edit.jsp의 수정화면에서 표현해야 하므로 여기서 저장함!
		mv.setViewName("edit");
		return mv;
		*/
		BbsVO vo = userService.getBbs(evcbbs_idx);
		
		//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		m.addAttribute("categoryName_ar", categoryName_ar);
		m.addAttribute("vo", vo); // Model은 request에 저장됨!
									//forward시 사용가능함!		
		
		int cnt = 0;
		if(categoryName_ar != null) 
			cnt = categoryName_ar.length;
		StringBuffer sb = CSSFont.StyleCode(2,cnt);
		m.addAttribute("sb",sb);
		
		return "evEdit";
		
	}
	
	@RequestMapping(value="/edit.ev", method=RequestMethod.POST)
	public ModelAndView edit(BbsVO vo, String cPage)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		// 요청시 파일이 첨부된 요청인지? 파일첨부가 없는 요청인지? 구별!
		//         multipart....                 application.....
		String ctx = request.getContentType();
		if(ctx.startsWith("multipart")) {
			
			MultipartFile mf = vo.getFile();
			if(mf != null && mf.getSize() > 0) {
				String realPath = application.getRealPath(bbs_upload);
				
				String fname = mf.getOriginalFilename();
				
				fname = FileRenameUtil.checkSameFileName(fname, realPath);
				mf.transferTo(new File(realPath, fname));//첨부파일 업로드
				
				vo.setEvcbbs_file_name(fname);
				vo.setEvcbbs_ori_name(fname);
			}
			vo.setEvcbbs_ip(request.getRemoteAddr());
			
			userService.edit(vo);//DB수정
			mv.setViewName("redirect:/view.ev?evcbbs_idx="+vo.getEvcbbs_idx()+"&cPage="+cPage);
		}else if(ctx.startsWith("application")) {
			BbsVO bvo = userService.getBbs(vo.getEvcbbs_idx());
			mv.addObject("vo", bvo);
			
			mv.setViewName("evEdit");
		}
		return mv;
	}
}








