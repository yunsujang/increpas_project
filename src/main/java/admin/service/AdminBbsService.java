package admin.service;

import ev.vo.BbsVO;

public interface AdminBbsService {
	 BbsVO[] categoryIdxToList(String begin, String end,String idx);
	 int ajaxTotalList(String idx);
	 int AdmindeleteBbs(String idx);
}
