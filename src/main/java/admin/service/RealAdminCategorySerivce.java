package admin.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import admin.dao.AdminCategoryDAO;
import ev.vo.CategoryVO;

@Service
public class RealAdminCategorySerivce implements AdminCategorySerivce {

	@Autowired
	AdminCategoryDAO c_dao;

	@Override
	public int totalCount() {
		return c_dao.totalCount();
	}

	@Override
	public CategoryVO[] getCategoryList(String begin, String end) {
		// TODO Auto-generated method stub
		return c_dao.getCategoryList(begin, end);
	}

	@Override
	public int deleteCategory(String name) {
		// TODO Auto-generated method stub
		return c_dao.deleteCategory(name);
	}

	@Override
	public CategoryVO[] getCategoryName() {
		
		return c_dao.getCategoryName();
	}

}
