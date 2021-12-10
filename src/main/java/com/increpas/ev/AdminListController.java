package com.increpas.ev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.dao.AdminEvbbsDAO;
import admin.service.AdminBbsService;
import admin.service.AdminCategorySerivce;
import admin.util.AdminCSSFont;
import admin.util.BbsPaging;
import admin.util.CategoryBbsPaging;
import ev.vo.BbsVO;
import ev.vo.CategoryVO;
import user.service.BbsService;
import user.service.CategoryService;
import user.util.CSSFont;

@Controller
public class AdminListController {

	@Autowired
	private AdminEvbbsDAO b_dao;

	@Autowired
	private AdminBbsService admin_bbsService;

	@Autowired
	private AdminCategorySerivce admin_categoryservice;

	@Autowired
	private CategoryService user_categoryservice;

	@Autowired
	private BbsService user_bbsService;

	int nowPage;
	int totalCount;
	int blockList = 20; // 한 페이지당 표현될 게시물 수
	int blockPage = 5;// 한 블럭당 표현될 페이지 수

	int ListNowPage;
	int ListTotalCount;
	int ListBlockList = 20; // 한 페이지당 표현될 게시물 수
	int ListBlockPage = 5;// 한 블럭당 표현될 페이지 수

	@RequestMapping("/admin.bbsList")
	public ModelAndView list(String cPage) {
		ModelAndView mv = new ModelAndView();

		if (cPage == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(cPage);

		totalCount = b_dao.totalCount();

		// 페이징 처리를 위한 객체 생성
		BbsPaging page = new BbsPaging(nowPage, totalCount, blockList, blockPage);

		int begin = page.getBegin();
		int end = page.getEnd();

		BbsVO[] ar = b_dao.getList(begin, end);
		
		
 
		CategoryVO[] categoryName_ar = user_categoryservice.categoryNameList();
		// JSP에서 표현해야 하므로 ar을 mv에 저장한다.
		mv.addObject("ar", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("blockList", blockList);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageCode", page.getSb().toString());
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.setViewName("AdminbbsList");

		return mv;
	}

	@RequestMapping(value = "/idxToName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> idxToName(String idx) {
		Map<String, String> map = new HashMap<String, String>();
		String name = admin_categoryservice.idToName(idx);
		map.put("name", name);
		return map;
	}

	@RequestMapping("/admin.bbsList2")
	public ModelAndView bbsList2(String category_idx, String cPage) {
		ModelAndView mv = new ModelAndView();
		if (cPage == null)
			ListNowPage = 1;
		else
			ListNowPage = Integer.parseInt(cPage);

		ListTotalCount = admin_bbsService.ajaxTotalList(category_idx);

		// 페이징 처리를 위한 객체 생성
		CategoryBbsPaging page = new CategoryBbsPaging(ListNowPage, ListTotalCount, ListBlockList, ListBlockPage, category_idx);

		int begin = page.getBegin();
		int end = page.getEnd();
		
		BbsVO[] ar = admin_bbsService.categoryIdxToList(String.valueOf(begin), String.valueOf(end), category_idx);
		
		CategoryVO cvo = user_categoryservice.nowCategory(category_idx);
		
		CategoryVO[] categoryName_ar = user_categoryservice.categoryNameList();
		
		StringBuffer sb = AdminCSSFont.AdminBbslistStyleCode(cvo, categoryName_ar);
		mv.addObject("categoryName_ar", categoryName_ar);
		mv.addObject("ar", ar);
		mv.addObject("nowPage", ListNowPage);
		mv.addObject("blockList", ListBlockList);
		mv.addObject("totalCount", ListTotalCount);
		mv.addObject("sb",sb);
		mv.addObject("pageCode", page.getSb().toString());
		mv.setViewName("AdminbbsList2");
		

		return mv;
	}

}
