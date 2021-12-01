package user.service;

import ev.vo.CategoryVO;

public interface CategoryService {
	CategoryVO nowCategory(String category_idx);
	
	//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
	CategoryVO[] categoryNameList();
}
