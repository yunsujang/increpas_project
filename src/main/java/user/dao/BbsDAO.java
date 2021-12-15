package user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ev.vo.BbsVO;



@Component
public class BbsDAO {
	@Autowired
	SqlSessionTemplate ss;
	
	//사용자가 클릭한 게시물 가져오기
	public BbsVO getBbs(String evbbs_idx) {
		return ss.selectOne("bbs.getBbs", evbbs_idx);
	}
	 
	//페이징 기법의 규칙에 맞게 게시물 가져오기
	public BbsVO[] paging(String evcategory_idx, String begin, String end) {
		Map<String, String>map = new HashMap<String, String>();
		BbsVO[] medium_ar = null;
		map.put("evcategory_idx", evcategory_idx);
		map.put("begin", begin);
		map.put("end", end);
		List<BbsVO>m_list = ss.selectList("bbs.paging", map);
		if(m_list != null && !m_list.isEmpty()) {
			medium_ar = new BbsVO[m_list.size()];
			m_list.toArray(medium_ar);
		}
			
		return medium_ar;
	}
	
	//게시물의 총 개수 가져오기
	public int totalCount(String evcategory_idx) {
		return ss.selectOne("bbs.totalCount", evcategory_idx);
	}
	
	//모든 게시물의 총 개수 가져오기
	public int AllTotalCount() {
		return ss.selectOne("bbs.AllTotalCount");
	}
	
	//검색 결과의 총 게시물 가져오기
	public BbsVO[] search(String searchValue, String begin, String end) {
		Map<String, String>map = new HashMap<String, String>();
		BbsVO[] medium_ar = null;
		map.put("searchValue", searchValue);
		map.put("begin", begin);
		map.put("end", end);
		
		List<BbsVO>m_list = ss.selectList("bbs.searchResult", map);
		if(m_list != null && !m_list.isEmpty()) {
			medium_ar = new BbsVO[m_list.size()];
			m_list.toArray(medium_ar);
		}
			
		return medium_ar;
	}
	
	//검색 결과의 총 게시물의 수
	public int searchTotalCount(String searchValue) {
		return ss.selectOne("bbs.searchTotalCount", searchValue);
	}
	
	
	//테이블에 마지막으로 업데이트 된 게시물 3개 가져오기
	public BbsVO[] lastUpdate() {
		BbsVO[] medium_ar = null;
		
		List<BbsVO>m_list = ss.selectList("bbs.lastUpdate");
		if(m_list != null && !m_list.isEmpty()) {
			medium_ar = new BbsVO[m_list.size()];
			m_list.toArray(medium_ar);
		}
			
		return medium_ar;
	}
	
	public BbsVO prenext(int idx) {
		String a = String.valueOf(idx);
		return ss.selectOne("bbs.prenext",a);
	}
	
	//bbs테이블 마지막 데이터 가져오기
	public BbsVO getLastData() {
		return ss.selectOne("bbs.getLastData");
	}
	
	//bbs테이블 첫번째 데이터 가져오기
		public BbsVO getFirstData() {
			return ss.selectOne("bbs.getFirstData");
	}
		
	//랜덤으로 추천 컨텐츠 가져오기
	public BbsVO recommendContent(int num) {
		return ss.selectOne("bbs.recommendContent", num);
	}
}
