package user.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import user.dao.CategoryDAO;
import user.vo.CategoryVO;

@Service
public class Category_realService implements CategoryService  {

	@Autowired
	CategoryDAO category_dao;

	@Override
	public CategoryVO nowCategory(String category_idx) {
		CategoryVO vo = category_dao.nowCategory(category_idx);
		return vo;
	}

	//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
	@Override
	public CategoryVO[] categoryNameList() {
		CategoryVO[] categoryNameList = category_dao.categoryNameList();

		return categoryNameList;
	}

}
