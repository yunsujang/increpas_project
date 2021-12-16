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
	public EvuserVO getComp(String id) {
		
		return m_dao.getComp(id);
	}

	@Override
	public int reg(EvuserVO vo ) {
		
		return m_dao.reg(vo);
	}

	@Override
	public EvuserVO adminLogin(String id, String pw) {
		
		return m_dao.adminLogin(id, pw);
	}

	@Override
	public EvuserVO login(String id, String pw) {
		// TODO Auto-generated method stub
		return m_dao.login(id, pw);
	}

	@Override
	public EvuserVO kakaologin(String email) {
		// TODO Auto-generated method stub
		return m_dao.kakaologin(email);
	}

	@Override
	public EvuserVO[] findId(String name, String email) {
		
		return m_dao.findId(name,email);
	}

}
