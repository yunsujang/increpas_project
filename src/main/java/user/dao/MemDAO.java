package user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ev.vo.EvuserVO;

@Component
public class MemDAO {
	@Autowired
	SqlSessionTemplate ss;
	
	public EvuserVO getComp(String id) {
		return ss.selectOne("login.getComp", id);
		
	}
	
	public EvuserVO login(String id,String pw) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return ss.selectOne("login.login", map);
		
	}
	
	
	public int reg(EvuserVO vo) {
		return ss.insert("login.reg", vo);
	}
	
	public EvuserVO adminLogin(String evu_id, String evu_pw) {
		Map<String, String>map = new HashMap<String, String>();
		System.out.println(evu_id);
		System.out.println(evu_pw);
		
		map.put("evu_id", evu_id);
		map.put("evu_pw", evu_pw);
		
		return ss.selectOne("login.adminlogin", map);
	}
	
	public EvuserVO kakaologin(String email) {
		return ss.selectOne("login.kakaologin", email);
	}
	
	public EvuserVO[] findId(String name, String email) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		EvuserVO[] ar = null;
		List<EvuserVO>list = ss.selectList("login.findId",map);
		if(list.size() > 0 && !list.isEmpty()) {
			ar = new EvuserVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	
	public EvuserVO findPw(String id, String email) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return ss.selectOne("login.findPw", map);
	}
	
	public int changePw(String id, String pw) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return ss.update("login.changePw", map);
	}
}
