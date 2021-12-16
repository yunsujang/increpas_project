package admin.service;

public interface AdminUserService {
	int AdminMakeUser(String makeId, String makePw, String makeName,String comp);
	int AdminMakeUserCheck(String makeId);
	int gradeChange(String who, String idx);
}
