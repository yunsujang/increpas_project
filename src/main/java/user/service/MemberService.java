package user.service;

import java.util.List;

import ev.vo.EvuserVO;

public interface MemberService {
	//회원 삭제
	public int deleteMember(String evu_idx);
	//회원 수정
	public int updateMember(String evu_idx);
	//회원정보 수정
	public int modiMember(EvuserVO vo);
	
}
