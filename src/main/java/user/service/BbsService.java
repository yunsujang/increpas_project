package user.service;

import ev.vo.BbsVO;

public interface BbsService {
	BbsVO getBbs(String evbbs_idx);
	BbsVO[] paging(String evcategory_idx, String begin,String end);
	int totalCount(String evcategory_idx);
	int searchTotalCount(String searchValue);
	BbsVO[] search(String searchValue, String begin, String end);
	
	//테이블에 마지막으로 업데이트 된 게시물 3개 가져오기
	BbsVO[] lastUpdate();
}
 