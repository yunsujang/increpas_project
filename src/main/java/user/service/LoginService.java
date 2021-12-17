package user.service;

import ev.vo.EvuserVO;

public interface LoginService {
	EvuserVO getComp(String id);
	int reg(EvuserVO vo);
	EvuserVO adminLogin(String id, String pw);
	EvuserVO login(String id,String pw);
	EvuserVO kakaologin(String email);
	EvuserVO[] findId(String name, String email);
	EvuserVO findPw(String id, String email);
	int changePw(String id, String pw);
}
