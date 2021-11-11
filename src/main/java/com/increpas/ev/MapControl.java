package com.increpas.ev;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapControl {

	


	@RequestMapping("/map")
	public String kakomap() {
		return "kakaoMap";
	}
	
	
	
}