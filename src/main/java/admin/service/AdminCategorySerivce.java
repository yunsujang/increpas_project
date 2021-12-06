package admin.service;

import java.util.Map;

import ev.vo.CategoryVO;

public interface AdminCategorySerivce {
	// 삭제하지않은 게시판의 갯수를 가져온다.
	int totalCount();
	
	// 페이징에 따른 카테고리들을 가져온다.
	CategoryVO[] getCategoryList(String begin, String end);
	
	//해당이름의 카테고리를 삭제한다.
	int deleteCategory(String name);
	
	//카테고리 이름을 가져온다.
	CategoryVO[] getCategoryName();
	
	//이름으로 번호를 가져온다.
	String getCategoryidx(String categoryName);
	
	//번호로 이름을 가져온다.
	String idToName(String categoryidx);
	
	//입력받은 카테고리명을 수정한다.
	int updateCategory(Map<String,Object> param);
	
	//입력받은 카테고리명이 중복인지 체크한다.
	int updateCategoryCheck(String changeCategory);
	
	
	//삭제한 게시판의 갯수를 가져온다.
	int deleteTotalCount();
	
	//삭제한 게시판 가져오기
	CategoryVO[] getRecoveryCategoryList(String begin, String end);
}
