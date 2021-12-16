package com.increpas.stock;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ev.vo.CategoryVO;
import ev.vo.StockVO;
import user.service.CategoryService;
import user.util.CSSFont;

@Controller
public class StockListController {

	@Autowired
	CategoryService categoryservice;
	
	@RequestMapping("/evStock")
	public String list(String[] args, Model model) {

		String URL = "https://finance.naver.com/item/main.naver?code=394660";
		Document doc;

		try {
			doc = Jsoup.connect(URL).userAgent(
					"Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36")
					.header("scheme", "https")
					.header("accept",
							"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
					.header("accept-encoding", "gzip, deflate, br")
					.header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6")
					.header("cache-control", "no-cache").header("pragma", "no-cache")
					.header("upgrade-insecure-requests", "1").get();

			Elements elem = doc.select(".date");
			String[] str = elem.text().split(" ");

			Elements todaylist = doc.select(".new_totalinfo dl>dd");

			String name = todaylist.get(1).text().split(" ")[1]+ todaylist.get(1).text().split(" ")[2];
			String NowPrice = todaylist.get(3).text().split(" ")[1];
			String vsyesterday = todaylist.get(3).text().split(" ")[3] + todaylist.get(3).text().split(" ")[4];
			String DungRakrate = todaylist.get(3).text().split(" ")[5] + todaylist.get(3).text().split(" ")[6]
					+ todaylist.get(3).text().split(" ")[7];
			String yesterdayPrice = todaylist.get(4).text().split(" ")[1];
			String sigaPrice = todaylist.get(5).text().split(" ")[1];
			String HighPrice = todaylist.get(6).text().split(" ")[1];
			String LowPrice = todaylist.get(8).text().split(" ")[1];
			String georaeryang = todaylist.get(10).text().split(" ")[1];
			String TradingValue = todaylist.get(11).text().split(" ")[1];


			StockVO svo1 = new StockVO(name, NowPrice, vsyesterday, DungRakrate, yesterdayPrice, sigaPrice, HighPrice, LowPrice, georaeryang, TradingValue);
		
		
			model.addAttribute("svo1", svo1);
			
			URL = "https://finance.naver.com/item/main.naver?code=371460";

			
				doc = Jsoup.connect(URL).userAgent(
						"Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36")
						.header("scheme", "https")
						.header("accept",
								"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
						.header("accept-encoding", "gzip, deflate, br")
						.header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6")
						.header("cache-control", "no-cache").header("pragma", "no-cache")
						.header("upgrade-insecure-requests", "1").get();

				elem = doc.select(".date");
				str = elem.text().split(" ");

				todaylist = doc.select(".new_totalinfo dl>dd");

				name = todaylist.get(1).text().split(" ")[1]+ todaylist.get(1).text().split(" ")[2];
				NowPrice = todaylist.get(3).text().split(" ")[1];
				vsyesterday = todaylist.get(3).text().split(" ")[3] + todaylist.get(3).text().split(" ")[4];
				DungRakrate = todaylist.get(3).text().split(" ")[5] + todaylist.get(3).text().split(" ")[6]
						+ todaylist.get(3).text().split(" ")[7];
				yesterdayPrice = todaylist.get(4).text().split(" ")[1];
				sigaPrice = todaylist.get(5).text().split(" ")[1];
				HighPrice = todaylist.get(6).text().split(" ")[1];
				LowPrice = todaylist.get(8).text().split(" ")[1];
				georaeryang = todaylist.get(10).text().split(" ")[1];
				TradingValue = todaylist.get(11).text().split(" ")[1];


				StockVO svo2 = new StockVO(name, NowPrice, vsyesterday, DungRakrate, yesterdayPrice, sigaPrice, HighPrice, LowPrice, georaeryang, TradingValue);
				model.addAttribute("svo2", svo2);
			/*
			 * System.out.println("종목명:"+name); System.out.println("현재가:"+NowPrice);
			 * System.out.println("전일대비:"+vsyesterday);
			 * System.out.println("등락율:"+DungRakrate); System.out.println("고가:"+HighPrice);
			 * System.out.println("저가:"+LowPrice); System.out.println("거래량:"+georaeryang);
			 * System.out.println("거래대금:"+TradingValue);
			 */
				int cnt = 0;
				CategoryVO[] categoryName_ar = categoryservice.categoryNameList();
				if(categoryName_ar != null) 
					cnt = categoryName_ar.length;
				StringBuffer sb = CSSFont.StyleCode(3,cnt);
				model.addAttribute("sb",sb);
				model.addAttribute("categoryName_ar", categoryName_ar);
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "evStockList";
		}
	}

