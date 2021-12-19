package user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ev.vo.EvuserVO;
import user.dao.MemDAO;

@Service
public class realMemberService implements MemberService {

	@Autowired
	MemDAO m_dao;
	
	@Override
	public int deleteMember(String evu_idx) {
		return m_dao.userdelete(evu_idx);

	}
	
	@Override
	public int updateMember(String evu_idx) {
		return m_dao.userupdate(evu_idx);				
	}
	//맴버 수정
	@Override
	public int modiMember(EvuserVO vo) {
		return m_dao.usermodify(vo);
		}
	
}
