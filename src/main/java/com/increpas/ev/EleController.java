package com.increpas.ev;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ev.vo.CategoryVO;
import mybatis.vo.EleVO;
import user.service.CategoryService;
import user.util.CSSFont;

@Controller
public class EleController {

	 @Autowired
	 CategoryService categoryservice;
	
	@RequestMapping("/evMap")
	public String data(Locale locale, Model model) throws Exception {
		StringBuffer sb = new StringBuffer(
				"http://apis.data.go.kr/B552584/EvCharger/getChargerInfo?serviceKey=VXGxM3FjoOVHGwjcIqHM4pa9aZW7Gbp0AvSTDrBcXpvwbv7QRBo6lrB9sPt9EqoldaidCOHjn%2F1E9XwDQm0%2BOA%3D%3D");
		sb.append("&numOfRows=800"); /*
										숫자 고치면 고친 수 만큼 마커 표시 늘어남 
										(엄청난 렉 때문에 많이 안높이는걸 추천)
			 							totalCount 2021-11-15 기준 87702
										totalCount 2021-11-24 기준 88318  +616
										totalCount 2021-12-08 기준 90140  +1822
									 */
		sb.append("&pageNo=1");
		
		URL url = new URL(sb.toString());//웹상의 경로를 객체화 시킨것
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();//http이기때문
		
		conn.setRequestProperty("Content-Type", "application/xml");
		
		//연결요청
		conn.connect();
		
		//JDOM
		SAXBuilder builder = new SAXBuilder();
		
		//다큐멘트-엘리먼트
		
		Document doc = builder.build(conn.getInputStream());
		Element root = doc.getRootElement();
		Element body = root.getChild("body");//하나
		Element items = body.getChild("items");//하나
		
		Element header = root.getChild("header");//헤더
		
		List<Element> item_list = items.getChildren("item"); //여러개이니 Children아이들
		
		System.out.println("totalCount :"+header.getChildText("totalCount"));//토탈카운트
		CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
		int i = 0;  
		EleVO[] ar = new EleVO[item_list.size()];
		for(Element item : item_list) {
			

		
			String limitYn =item.getChildText("limitYn");
			String note = item.getChildText("note");
			String parkingFree = item.getChildText("parkingFree");
			String stat = item.getChildText("stat");
			String busiCall = item.getChildText("busiCall");
			String busiNm = item.getChildText("busiNm");
			String useTime = item.getChildText("useTime");
			String lat = item.getChildText("lat"); //위도
			String lng = item.getChildText("lng"); //경도
			String addr = item.getChildText("addr");
			String chgerType = item.getChildText("chgerType");
			String statNm = item.getChildText("statNm");
			String statId = item.getChildText("statId");
			String chgerId = item.getChildText("chgerId");
			String location = item.getChildText("location");
			
			EleVO vo = new EleVO(limitYn, note, parkingFree, stat, busiCall, busiNm, useTime, lat, lng, addr, chgerType, statNm, statId, chgerId, location);
			ar[i++] = vo;
		}
		int cnt = 0;
		if(categoryName_ar != null) 
			cnt = categoryName_ar.length;
		StringBuffer fontsb = CSSFont.StyleCode("map",cnt);
		
		model.addAttribute("sb", fontsb);
		model.addAttribute("list", ar);
		model.addAttribute("categoryName_ar", categoryName_ar);
		return "evMap";
		
	}
}













