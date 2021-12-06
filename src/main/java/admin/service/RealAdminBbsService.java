package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminCategoryDAO;
import admin.dao.AdminEvbbsDAO;
import ev.vo.BbsVO;
import ev.vo.CategoryVO;

@Service
public class RealAdminBbsService implements AdminBbsService {

	@Autowired
	AdminEvbbsDAO admin_bbsDao;

	@Override
	public BbsVO[] categoryIdxToList(String begin, String end, String idx) {
		return admin_bbsDao.categoryIdxToList(begin, end, idx);
	}

	@Override
	public int ajaxTotalList(String idx) {
		// TODO Auto-generated method stub
		return admin_bbsDao.ajaxTotalList(idx);
	}

	@Override
	public int AdmindeleteBbs(String name) {
		// TODO Auto-generated method stub
		return admin_bbsDao.AdmindeleteBbs(name);
	}

	@Override
	public int ajaxTotalList2(String name) {
		// TODO Auto-generated method stub
		return admin_bbsDao.ajaxTotalList(name);
	}

	@Override
	public int AdminRecoveryBbs(String idx) {
		// TODO Auto-generated method stub
		return admin_bbsDao.AdminRecoveryBbs(idx);
	}
}
