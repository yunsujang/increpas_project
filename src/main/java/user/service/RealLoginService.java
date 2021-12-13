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
	public int reg(EvuserVO vo ) {
		
		return m_dao.reg(vo);
	}

	@Override
	public EvuserVO adminLogin(String id, String pw) {
		
		return m_dao.adminLogin(id, pw);
	}

}
