package admin.service;

import ev.vo.BbsVO;

public interface AdminBbsService {
	 BbsVO[] categoryIdxToList(String begin, String end,String idx);
	 //idx로 게시물 갯수 가져오기
	 int ajaxTotalList(String idx);
	 int AdmindeleteBbs(String name);
	 //이름으로 게시물 갯수 가져오기
	 int ajaxTotalList2(String name);
}
