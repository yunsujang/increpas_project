package admin.service;

import java.util.Map;

import ev.vo.CategoryVO;

public interface AdminCategorySerivce {
	int totalCount();
	CategoryVO[] getCategoryList(String begin, String end);
	int deleteCategory(String name);
	CategoryVO[] getCategoryName();
	String getCategoryidx(String categoryName);
	String idToName(String categoryidx);
	int updateCategory(Map<String,Object> param);
	int updateCategoryCheck(String changeCategory);
}
