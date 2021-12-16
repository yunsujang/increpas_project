package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminUserDAO;

@Service
public class RealAdminUserService implements AdminUserService {

	@Autowired
	AdminUserDAO a_dao;

	@Override
	public int AdminMakeUser(String makeId, String makePw, String makeName, String comp) {
		// TODO Auto-generated method stub
		return a_dao.AdminMakeUser(makeId, makePw, makeName, comp);
	}

	@Override
	public int AdminMakeUserCheck(String makeId) {
		// TODO Auto-generated method stub
		return a_dao.AdminMakeUserCheck(makeId);
	}

	@Override
	public int gradeChange(String who, String idx) {
		// TODO Auto-generated method stub
		return a_dao.gradeChange(who, idx);
	}
	
}
