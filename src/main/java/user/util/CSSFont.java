package user.util;

import ev.vo.CategoryVO;

public class CSSFont {
	
	static public StringBuffer homeStyleCode() {
		StringBuffer style =  new StringBuffer("<style>.menu_ul li:first-child{");
		style.append("border-bottom: 3.5px solid white;}");
		style.append("</style>");
		return style;
	}
	
	static public StringBuffer listStyleCode(CategoryVO nowCategory, CategoryVO[] categoryName_ar) {
		int i = 2;
		for(CategoryVO cvo : categoryName_ar) {
			if(cvo.getEvcategory_idx().equals(nowCategory.getEvcategory_idx())) {
				break;
			}
			i++;
		}
		StringBuffer style =  new StringBuffer("<style>.menu_ul li:nth-child(");
		style.append(String.valueOf(i));
		style.append("){border-bottom: 3.5px solid white;}");
		style.append("</style>");
		return style;
	}
	 
	static public StringBuffer StyleCode(int num, int cnt) {
		int i = 0;
		switch (num) {
		case 1:
			i = cnt+2;
			break;
		
		case 2:
			i = cnt+3;
			break;
			
		case 3:
			 i = cnt+4;
			break;

		default:
			break;
		}
		
		StringBuffer style =  new StringBuffer("<style>.menu_ul li:nth-child(");
		style.append(String.valueOf(i));
		style.append("){border-bottom: 3.5px solid white;}");
		style.append("</style>");
		return style;
	}
}
