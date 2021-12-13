package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


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
	
	public int totalCount() {
		return ss.selectOne("adminUser.totalCount");
	}
	
	//관리자 계정 생성
	public int AdminMakeUser(String makeId, String makePw, String makeName) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("evu_id", makeId);
		map.put("evu_pw", makePw);
		map.put("evu_name", makeName);
		
		return ss.insert("adminUser.AdminMakeUser", map);
	}

	//관리자 계정 아이디 중복체크
	public int AdminMakeUserCheck(String makeId) {
		return ss.selectOne("adminUser.AdminMakeUserCheck", makeId);
	}
}
