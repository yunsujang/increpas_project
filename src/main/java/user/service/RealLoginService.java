package user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ev.vo.EvuserVO;
import user.dao.MemDAO;


@Service
public class RealLoginService implements LoginService {

	@Autowired
	MemDAO m_dao;
	
	@Override
	public EvuserVO login(String id, String pw) {
		
		return m_dao.login(id, pw);
	}

	@Override
	public int reg(String id, String pw , String name ,String email, String phone ) {
		
		return m_dao.reg(id, pw ,name, email, phone);
	}

	@Override
	public EvuserVO adminLogin(String id, String pw) {
		
		return m_dao.adminLogin(id, pw);
	}

}
