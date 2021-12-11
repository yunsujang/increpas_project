package com.increpas.stock;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;


public class DateController {
	
public static void main(String[] args) throws ParseException {
		 
		String URL = "https://finance.naver.com/item/frgn.naver?code=394660";
		Document doc;

		try {
			doc = Jsoup.connect(URL).userAgent("Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36")
		            .header("scheme", "https")
		            .header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
		            .header("accept-encoding", "gzip, deflate, br")
		            .header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6")
		            .header("cache-control", "no-cache")
		            .header("pragma", "no-cache")
		            .header("upgrade-insecure-requests", "1")
		            .get();
			
			
			
			Elements datelist =doc.select(".tc .tah"); //.type2
			
			String[] str = datelist.text().split(" ");
			
			
			for(int i=0; i<str.length; i++) {
				
				System.out.println(str[i]);
								
			}
			

			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}
}
