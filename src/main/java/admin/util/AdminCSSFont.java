package admin.util;

import ev.vo.CategoryVO;

public class AdminCSSFont {
	static public StringBuffer AdminBbslistStyleCode(CategoryVO nowCategory, CategoryVO[] categoryName_ar) {
		int i = 2;
		for(CategoryVO cvo : categoryName_ar) {
			if(cvo.getEvcategory_idx().equals(nowCategory.getEvcategory_idx())) {
				break;
			}
			i++;   
		}
		StringBuffer style =  new StringBuffer("<style>.tabnav li:nth-child(");
		style.append(String.valueOf(i));
		style.append("){background-color: white;  }");
		style.append(".tabnav li:nth-child(");
		style.append(String.valueOf(i));
		style.append(") a{color: #7ea21e;  }");
		style.append("</style>");
		return style;
	}

}
