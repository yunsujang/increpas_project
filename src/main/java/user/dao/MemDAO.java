package user.dao;

import java.util.HashMap;
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
	

}
