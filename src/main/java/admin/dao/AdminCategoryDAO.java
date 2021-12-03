package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ev.vo.CategoryVO;

@Component
public class AdminCategoryDAO {

	@Autowired
	SqlSessionTemplate ss;

	// 페이징 기법을 위해 모든 게시판의 갯수를 반환하는 기능
	public int totalCount() {

		return ss.selectOne("category.AdmintotalCount");
	}
	
	// 받은 갯수만큼 게시글들을 반환하는 기능
	public CategoryVO[] getCategoryList(String begin, String end) {
		CategoryVO[] ar = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end", end);

		List<CategoryVO> list = ss.selectList("category.AdmingetCategoryList", map);
		
		System.out.println(list.size());
		if (list != null & !list.isEmpty()) {
			ar = new CategoryVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}

	//해당하는 게시판 삭제하는 기능
	public int deleteCategory(String name) {
		return ss.update("category.AdmindeleteCategory", name);
	}

	// 글쓰기에서 게시글을 쓸 게시판 선택을 위한 기능
	public CategoryVO[] getCategoryName() {
		CategoryVO[] ar = null;
		List<CategoryVO> list = ss.selectList("category.AdmingetCategoryName");

		if (list != null & !list.isEmpty()) {
			ar = new CategoryVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	
	// 카테고리명으로 카테고리 idx 반환하는 기능
		public String getCategoryIdx(String categoryName) {
			return ss.selectOne("category.getCategoryIdx", categoryName);
		}
		
	public String idxToName(String category_idx) {
		return ss.selectOne("category.idxToName",category_idx);
	}
}
