package user.service;

import mybatis.vo.BbsVO;
import mybatis.vo.CommentVO;

public interface UserBbsService {
	
	public BbsVO[] getList(int begin, int end, String evcategory_idx);
	public BbsVO[] search(String searchValue, String begin, String end);
	public int searchTotalCount(String searchValue);
	public int getTotalCount(String evcategory_idx);
	public BbsVO getBbs(String evcbbs_idx);
	public int add(BbsVO vo);
	public int addAns(CommentVO vo);
	public int edit(BbsVO vo);
	public int delBbs(String evcbbs_idx);
	public int updateHit(String evcbbs_idx);
	public int commDel(String evccomment_idx);
}
 