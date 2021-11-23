package user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import user.vo.CategoryVO;

@Component
public class CategoryDAO {
	
	@Autowired
	SqlSessionTemplate ss;
	
	//헤더ㆍ푸터에 게시판 목록을 표시 및 해당 게시판으로 이동하기 위해서 게시판 리스트 가져오기
	public CategoryVO[] categoryNameList()
 {
		CategoryVO[] arr = null;
		List<CategoryVO>categoryNameList = ss.selectList("category.categoryNameList");
		if(categoryNameList != null && !categoryNameList.isEmpty()) {
			arr = new CategoryVO[categoryNameList.size()];
			categoryNameList.toArray(arr);
		}
			
		return arr;
	}
	
	public CategoryVO nowCategory(String evcategory_idx) {
		return ss.selectOne("category.nowCategory",evcategory_idx);
	}
	

}
