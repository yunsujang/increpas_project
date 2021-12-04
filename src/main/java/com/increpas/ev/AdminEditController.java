package com.increpas.ev;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.dao.AdminEvbbsDAO;
import admin.service.AdminCategorySerivce;
import admin.util.FileRenameUtil;
import ev.vo.BbsVO;
import ev.vo.CategoryVO;
import ev.vo.ImgVO;

@Controller
public class AdminEditController {
	
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private AdminCategorySerivce admincategoryservice;
	
	@Autowired
	private AdminEvbbsDAO bbs_dao;
	
	@Autowired 
	private HttpSession session;
	
	//에디터에서 이미지가 들어갈 때 해당 이미지를 받아서
	// 저장할 위치
	private String editor_img = "/resources/editor_img";
	private String bbs_upload = "/resources/bbs_upload";
	
	@RequestMapping("/admin.edit")
	 public String edit(String evbbs_idx, Model m) {
		

		BbsVO vo = bbs_dao.getBbs(evbbs_idx);

		m.addAttribute("vo", vo);

		return  "Adminedit";
	}
	
	
	@RequestMapping(value="/admin.edit", method=RequestMethod.POST)
	public ModelAndView edit(BbsVO vo, String cPage)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		String ctx = request.getContentType();
		
		if(ctx.startsWith("multipart")) {
		
		//첨부파일을 vo로부터 얻어낸다.
		MultipartFile mf = vo.getFile();
		
		if(mf != null && mf.getSize() > 0) {
			String realPath = application.getRealPath(bbs_upload);
			
			String fname = mf.getOriginalFilename();
			
			
			
			fname = FileRenameUtil.checkSameFileName(fname, realPath);
			mf.transferTo(new File(realPath, fname));
			
			//첨부파일 업로드

		
			vo.setEvbbs_file_name(fname);
			vo.setEvbbs_ori_name(fname);
		}		

		vo.setEvbbs_ip(request.getRemoteAddr());
		
		bbs_dao.edit(vo); //DB 수정
		
		mv.setViewName("redirect:/admin.view?evbbs_idx="+vo.getEvbbs_idx()+"&cPage="+cPage);
		}else if(ctx.startsWith("application")) {
			BbsVO bvo = bbs_dao.getBbs(vo.getEvbbs_idx());
			mv.addObject("vo", bvo);
			
			mv.setViewName("Adminedit");
		}
		
		
		
		return mv;
	}
	
	
}


	


