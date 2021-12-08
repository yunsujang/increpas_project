package user.service;

import ev.vo.EvuserVO;

public interface LoginService {
	EvuserVO login(String id, String pw);
	int reg(String id, String pw , String name ,String email, String phone );
}
