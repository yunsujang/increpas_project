package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import ev.vo.EvuserVO;

@Component
public class AdminUserDeletedDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	//유저 목록 가져오기
	public EvuserVO[] getList(int begin, int end) {
		EvuserVO[]ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end",  String.valueOf(end));
		
		List<EvuserVO> list = ss.selectList("adminUser.deleteduser",map);
		
		if(list != null && list.size() > 0) {
			ar = new EvuserVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	

	
	public int deletedtotalCount() {
		return ss.selectOne("adminUser.deletedtotalCount");
	}

	//검색 결과의 총 유저 가져오기
	public EvuserVO[] search(String searchValue, String begin, String end) {
		Map<String, String>map = new HashMap<String, String>();
		EvuserVO[] ar = null;
		map.put("searchValue", searchValue);
		map.put("begin", begin);
		map.put("end", end);
		
		List<EvuserVO>m_list = ss.selectList("adminUser.searchResult2", map);
		if(m_list != null && !m_list.isEmpty()) {
			ar = new EvuserVO[m_list.size()];
			m_list.toArray(ar);
		}
			
		return ar;
	}	
	
	//검색 결과의 총 게시물의 수
	public int searchTotalCount(String searchValue) {
		return ss.selectOne("adminUser.searchTotalCount2", searchValue);
	}

}
