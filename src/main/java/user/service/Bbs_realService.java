package user.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ev.vo.BbsVO;
import user.dao.BbsDAO;

@Service
public class Bbs_realService implements BbsService {
	@Autowired
	BbsDAO bbs_dao;
	
	@Override
	public BbsVO getBbs(String evbbs_idx) {
		
		return bbs_dao.getBbs(evbbs_idx);
	}
 
	@Override
	public BbsVO[] paging(String evcategory_idx, String begin, String end) {
		return bbs_dao.paging(evcategory_idx, begin, end);
	}

	@Override
	public int totalCount(String evcategory_idx) {
		
		return bbs_dao.totalCount(evcategory_idx);
	}

	@Override
	public BbsVO[] search(String searchValue, String begin, String end) {
		return bbs_dao.search(searchValue,begin,end);
	}

	@Override
	public int searchTotalCount(String searchValue) {
		return bbs_dao.searchTotalCount(searchValue);
	}

	//테이블에 마지막으로 업데이트 된 게시물 3개 가져오기
	@Override
	public BbsVO[] lastUpdate() {
		return bbs_dao.lastUpdate();
	}

	@Override
	public BbsVO prenext(int idx) {
		// TODO Auto-generated method stub
		return bbs_dao.prenext(idx);
	}

	@Override
	public BbsVO getLastData() {
		// TODO Auto-generated method stub
		return  bbs_dao.getLastData();
	}

	@Override
	public BbsVO getFirstData() {
		// TODO Auto-generated method stub
		return  bbs_dao.getFirstData();
	}

	@Override
	public int AllTotalCount() {
		// TODO Auto-generated method stub
		return bbs_dao.AllTotalCount();
	}

	@Override
	public BbsVO recommendContent(int num) {
		// TODO Auto-generated method stub
		return bbs_dao.recommendContent(num);
	}
	
}
