package com.increpas.bbs;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

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

import ev.vo.EvuserVO;
import mybatis.vo.BbsVO;
import mybatis.vo.CommentVO;
import user.dao.UserBbsDAO;
import user.service.UserBbsService;
import user.util.FileRenameUtil;

@Controller
public class BbsWriteController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private UserBbsDAO b_dao;
	 
	@Autowired
	UserBbsService userService;
	
	
	//에디터에서 이미지가 들어갈 때 해당 이미지를 받아서
	// 저장할 위치
	private String editor_img = "/resources/editor_img";
	private String bbs_upload = "/resources/bbs_upload";
	
	@RequestMapping("/write.ev")
	public String write() {
		return "evWrite";
	}
	
	@RequestMapping(value="/saveImg.ev", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveImg(ev.vo.ImgVO ivo){
		//반환객체 생성
		Map<String, String> map = new HashMap<String, String>();
		
		//넘어온 이미지를 ivo에서 가져온다.
		MultipartFile f = ivo.getS_file();
		String fname = null;
		
		if(f.getSize() > 0) {
			String realPath = application.getRealPath(editor_img);
			fname = f.getOriginalFilename();
			
			//이미지가 이미 저장된 이미지 이름과 동일하다면 파일명 뒤에
			//숫자를 하나붙여서 이름이 같은 경우가 발생하지 않도록 해야 함!
			fname = FileRenameUtil.checkSameFileName(fname, realPath);
			try {
				f.transferTo(new File(realPath, fname));//파일 업로드!!!!!!!!!
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String c_path = request.getContextPath();
		
		map.put("url", c_path+editor_img);
		map.put("fname", fname);
		
		return map;
	}
	
	@RequestMapping(value="/write.ev", method=RequestMethod.POST)
	public ModelAndView write(BbsVO vo)throws Exception{
		
		//첨부파일을 vo로부터 얻어낸다.
		MultipartFile mf = vo.getFile();
		//System.out.println(vo.getEvcbbs_title()+"//"+vo.getEvcbbs_content());
		if(mf != null && mf.getSize() > 0) {
			String realPath = application.getRealPath(bbs_upload);
			
			String fname = mf.getOriginalFilename();
			
			fname = FileRenameUtil.checkSameFileName(fname, realPath);
			
			//첨부파일 업로드
			mf.transferTo(new File(realPath, fname));
			    
			vo.setEvcbbs_file_name(fname);
			vo.setEvcbbs_ori_name(fname);
		}		
		//vo.setEvcategory_idx("1");
		vo.setEvcbbs_ip(request.getRemoteAddr());
		
		EvuserVO mvo = (EvuserVO)session.getAttribute("mvo");
		
		vo.setEvu_idx(mvo.getEvu_idx()); 
		//System.out.println(mvo.getEvu_idx());
		userService.add(vo); //DB에 저장!!!!!!!!!!!
		
		ModelAndView mv = new ModelAndView();
		
		//System.out.println(vo.getEvcbbs_idx()+"/"+
		//vo.getEvcbbs_file_name()+"/"+vo.getEvcbbs_content());
		
		mv.setViewName("redirect:/list.ev");
		
		return mv;
	}
			//댓글
		@RequestMapping("/ans_write.ev")
		public ModelAndView ans_write(CommentVO cvo,String cPage) {
			
			ModelAndView mv = new ModelAndView();
			//System.out.println(cvo.getEvccomment_content()+"/"+cvo.getEvccomment_writer());
			//댓글정보가 모두 cvo에 저장되어 넘어왔다.
			Object obj =  session.getAttribute("mvo");
			
			EvuserVO evo = (EvuserVO) obj;
			cvo.setEvu_idx(evo.getEvu_idx());
			userService.addAns(cvo);
			
																				//cPage Change 1
			mv.setViewName("redirect:/view.ev?evcbbs_idx="+cvo.getEvcbbs_idx()+"&cPage="+1);
			
			return mv;
		}
}












