package admin.service;

import java.util.Map;

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

	@Override
	public String getCategoryidx(String categoryName) {
		return c_dao.getCategoryIdx(categoryName);
	}

	@Override
	public String idToName(String categoryidx) {
		// TODO Auto-generated method stub
		return c_dao.idxToName(categoryidx);
	}
	
	@Override
	public int updateCategory(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return c_dao.updateCategory(param);
	}
	
	@Override
	public int updateCategoryCheck(String changeCategory) {
		// TODO Auto-generated method stub
		return c_dao.updateCategoryCheck(changeCategory);
	}
 
	@Override
	public int deleteTotalCount() {
		// TODO Auto-generated method stub
		return c_dao.deleteTotalCount();
	}

	@Override
	public CategoryVO[] getRecoveryCategoryList(String begin, String end) {
		// TODO Auto-generated method stub
		return c_dao.getRecoveryCategoryList(begin, end);
	}

	@Override
	public int RecoveryCategory(String name) {
		// TODO Auto-generated method stub
		return c_dao.RecoveryCategory(name);
	}

	@Override
	public int makeCategory(String makeName) {
		// TODO Auto-generated method stub
		return c_dao.makeCategory(makeName);
	}

	@Override
	public int makeCategoryCheck(String makeName) {
		// TODO Auto-generated method stub
		return c_dao.makeCategoryCheck(makeName);
	}

}
