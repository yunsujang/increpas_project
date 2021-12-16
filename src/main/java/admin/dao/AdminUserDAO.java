package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ev.vo.BbsVO;
import ev.vo.EvuserVO;

@Component
public class AdminUserDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	//유저 목록 가져오기
	public EvuserVO[] getList(int begin, int end) {
		EvuserVO[]ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end",  String.valueOf(end));
		
		List<EvuserVO> list = ss.selectList("adminUser.user",map);
		
		if(list != null && list.size() > 0) {
			ar = new EvuserVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//회원 강제 탈퇴
	public int deleteUser(String evu_idx) {
		return ss.update("adminUser.AdmindeleteUser", evu_idx);
	}
	
	//기본키를 인자로 하여 검색
	public EvuserVO getBbs(String evu_idx) {
		return ss.selectOne("adminUser.AdmingetUser", evu_idx);
	}	
	
	
	public int totalCount() {
		return ss.selectOne("adminUser.totalCount");
	}
	
	//관리자 계정 생성
	public int AdminMakeUser(String makeId, String makePw, String makeName, String comp) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("evu_id", makeId);
		map.put("evu_pw", makePw);
		map.put("evu_name", makeName);
		map.put("evu_comp", comp);
		
		return ss.insert("adminUser.AdminMakeUser", map);
	}

	//관리자 계정 아이디 중복체크
	public int AdminMakeUserCheck(String makeId) {
		return ss.selectOne("adminUser.AdminMakeUserCheck", makeId);
	}
	
	
	//검색 결과의 총 유저 가져오기
		public EvuserVO[] search(String searchValue, String begin, String end) {
			Map<String, String>map = new HashMap<String, String>();
			EvuserVO[] ar = null;
			map.put("searchValue", searchValue);
			map.put("begin", begin);
			map.put("end", end);
			
			List<EvuserVO>m_list = ss.selectList("adminUser.searchResult", map);
			if(m_list != null && !m_list.isEmpty()) {
				ar = new EvuserVO[m_list.size()];
				m_list.toArray(ar);
			}
				
			return ar;
		}
		
		//검색 결과의 총 게시물의 수
		public int searchTotalCount(String searchValue) {
			return ss.selectOne("adminUser.searchTotalCount", searchValue);
		}
		
		//선택한 계정의 등급 변경
		public int gradeChange(String who, String idx) {
			Map<Object, Object>map = new  HashMap<Object, Object>();
			map.put("evu_who", who);
			map.put("evu_idx", idx);
			return ss.update("adminUser.gradeChange", map);
		}
	
	
}
