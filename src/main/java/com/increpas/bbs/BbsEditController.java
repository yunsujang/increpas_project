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

import mybatis.vo.BbsVO;
import user.dao.UserBbsDAO;
import user.util.FileRenameUtil;

@Controller
public class BbsEditController {

	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private UserBbsDAO b_dao;
	
	private String editor_img = "/resources/editor_img";
	private String bbs_upload = "/resources/bbs_upload";
	
	@RequestMapping("/edit.ev")
	//public ModelAndView edit(String evbbs_idx) {
	public String edit(String evbbs_idx, Model m) {
		/*
		ModelAndView mv = new ModelAndView();
		
		BbsVO2 vo = b_dao.getBbs(evbbs_idx);
		mv.addObject("vo", vo);// edit.jsp의 수정화면에서 표현해야 하므로 여기서 저장함!
		mv.setViewName("edit");
		return mv;
		*/
		BbsVO vo = b_dao.getBbs(evbbs_idx);
		
		m.addAttribute("vo", vo); // Model은 request에 저장됨!
									//forward시 사용가능함!		
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
				
				vo.setEvbbs_file_name(fname);
				vo.setEvbbs_ori_name(fname);
			}
			vo.setEvbbs_ip(request.getRemoteAddr());
			
			b_dao.edit(vo);//DB수정
			mv.setViewName("redirect:/view.ev?evbbs_idx="+vo.getEvbbs_idx()+"&cPage="+cPage);
		}else if(ctx.startsWith("application")) {
			BbsVO bvo = b_dao.getBbs(vo.getEvbbs_idx());
			mv.addObject("vo", bvo);
			
			mv.setViewName("evEdit");
		}
		return mv;
	}
}








