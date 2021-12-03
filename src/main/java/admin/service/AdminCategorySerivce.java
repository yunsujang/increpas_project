package admin.service;

import ev.vo.CategoryVO;

public interface AdminCategorySerivce {
	int totalCount();
	CategoryVO[] getCategoryList(String begin, String end);
	int deleteCategory(String name);
	CategoryVO[] getCategoryName();
	String getCategoryidx(String categoryName);
	String idToName(String categoryidx);
}
