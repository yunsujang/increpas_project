package com.increpas.ev;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.dao.AdminCategoryDAO;
import admin.dao.AdminEvbbsDAO;
import admin.service.AdminCategoryService;
import admin.util.FileRenameUtil;
import ev.vo.BbsVO;
import ev.vo.CategoryVO;
import ev.vo.EvuserVO;
import ev.vo.ImgVO;

@Controller
public class AdminWriteController {

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private AdminCategoryService admincategoryservice;
	
	@Autowired
	private AdminEvbbsDAO bbs_dao;
	
	@Autowired 
	private HttpSession session;
	 
	//에디터에서 이미지가 들어갈 때 해당 이미지를 받아서
	// 저장할 위치
	private String editor_img = "/resources/editor_img";
	private String bbs_upload = "/resources/bbs_upload";
	
	@RequestMapping("/admin.bbsWrite")
	public ModelAndView write() {
		ModelAndView mv = new ModelAndView();
		EvuserVO evo = (EvuserVO)session.getAttribute("mvo");
		
		CategoryVO[]cvo = admincategoryservice.getCategoryName();
		session.setAttribute("evo",evo);
		mv.addObject("cvo", cvo);
		mv.setViewName("AdminbbsWrite");
		return mv;
	}

	@RequestMapping(value = "/saveImg.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveImg(ImgVO vo) {
		// 반환객체 생성
		Map<String, String> map = new HashMap<String, String>();
		MultipartFile mf = vo.getS_file();
		String fname = null;

		if (mf.getSize() > 0) {
			String realPath = application.getRealPath(editor_img);
			fname = mf.getOriginalFilename();

			// 이미지가 이미 저장된 이름과 동일하다면 파일명 뒤에
			// 숫자를 붙여서 이름이 같은 경우가 발생하지 않도록 한다.
			fname = FileRenameUtil.checkSameFileName(fname, realPath);

			try {
				mf.transferTo(new File(realPath, fname)); // 파일 업로드
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

		String c_path = request.getContextPath();
		String a = c_path+editor_img;
		map.put("url", c_path + editor_img);
		map.put("fname", fname);

		return map;
	}
	
	@RequestMapping(value="/admin.bbsWrite", method=RequestMethod.POST)
	public ModelAndView write(BbsVO vo){
		
		//첨부파일을 vo로부터 얻어낸다.
		MultipartFile mf = vo.getFile();
		
		if(mf != null && mf.getSize() > 0) {
			String realPath = application.getRealPath(bbs_upload);
			
			String fname = mf.getOriginalFilename();
			
			
			
			fname = FileRenameUtil.checkSameFileName(fname, realPath);
			
			//첨부파일 업로드
			try {
				mf.transferTo(new File(realPath, fname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			    
			vo.setEvbbs_file_name(fname);
			vo.setEvbbs_ori_name(fname);
		}		

		vo.setEvbbs_ip(request.getRemoteAddr());
		Object obj = session.getAttribute("mvo");
		EvuserVO evo = (EvuserVO) obj;
		vo.setEvu_idx(evo.getEvu_idx());
		
		bbs_dao.add(vo); //DB에 저장!!!!!!!!!!!
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admin.bbsList");
		
		return mv;
	}
	
	@RequestMapping(value = "getCategoryidx", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> getCategoryidx(String selectCategory){
		Map<String, String>map = new HashMap<String, String>();
		String categoryidx = admincategoryservice.getCategoryidx(selectCategory);
		map.put("code", categoryidx);
		
		return map;
		
	}
}












