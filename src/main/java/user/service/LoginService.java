package user.service;

import ev.vo.EvuserVO;

public interface LoginService {
	EvuserVO login(String id, String pw);
	int reg(EvuserVO vo);
	EvuserVO adminLogin(String id, String pw);
}
