package user.service;

import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BbsVO;
import mybatis.vo.CommentVO;
import user.dao.UserBbsDAO;

public class UserBbs_realService implements UserBbsService {
	
	@Autowired
	UserBbsDAO ubbs_dao;
	
	
	@Override
	public BbsVO[] getList(int begin, int end, String evcategory_idx) {
		return ubbs_dao.getList(begin, end, evcategory_idx);
	}

	@Override
	public BbsVO[] search(String searchValue, String begin, String end) {
		return ubbs_dao.search(searchValue, begin, end);
	}

	@Override
	public int searchTotalCount(String searchValue) {
		return ubbs_dao.searchTotalCount(searchValue);
	}

	@Override
	public int getTotalCount(String evcategory_idx) {
		return ubbs_dao.getTotalCount(evcategory_idx);
	}

	@Override
	public BbsVO getBbs(String evcbbs_idx) {
		return ubbs_dao.getBbs(evcbbs_idx);
	}

	@Override
	public int add(BbsVO vo) {
		return ubbs_dao.add(vo);
	}

	@Override
	public int addAns(CommentVO vo) {
		return ubbs_dao.addAns(vo);
	}

	@Override
	public int edit(BbsVO vo) {
		return ubbs_dao.edit(vo);
	}

	@Override
	public int delBbs(String evcbbs_idx) {
		return ubbs_dao.delBbs(evcbbs_idx);
	}

	@Override
	public int updateHit(String evcbbs_idx) {
		return ubbs_dao.updateHit(evcbbs_idx);
	}

}
