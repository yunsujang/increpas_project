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
	
	public EvuserVO login(String id, String pw) {
		Map<String, String>map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		return ss.selectOne("login.login", map);
		
	}
	
	
	
	
	public int reg(String id, String pw , String name ,String email, String phone ) {
		Map<String , String>map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("name", name);
		map.put("email", email);
		map.put("phone", phone);
			
		
		
		
		return ss.insert("login.reg", map);
	}
	

}
