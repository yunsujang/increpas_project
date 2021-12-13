package user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.BbsVO;
import mybatis.vo.CommentVO;

@Component
public class UserBbsDAO {

	@Autowired
	private SqlSessionTemplate ss;
 	
	//원하는 페이지의 게시물목록 기능
	public BbsVO[] getList(int begin, int end, String evcategory_idx) {
		BbsVO[] ar = null;
		
		//맵퍼(bbs2.list)를 호출하기 위해 Map구조 생성!
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("evcategory_idx", evcategory_idx);
		
		List<BbsVO> list = ss.selectList("userBbs.list", map);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
			//게시판검색
	public BbsVO[] search(String searchValue, String begin, String end) {
		Map<String, String>map = new HashMap<String, String>();
		BbsVO[] medium_ar = null;
		map.put("searchValue", searchValue);
		map.put("begin", begin);
		map.put("end", end);
		List<BbsVO>m_list = ss.selectList("userBbs.searchResult", map);
		if(m_list != null && !m_list.isEmpty()) {
			medium_ar = new BbsVO[m_list.size()];
			m_list.toArray(medium_ar);
		}
			
		return medium_ar;
	}
	
	public int searchTotalCount(String searchValue) {
		return ss.selectOne("userBbs.searchTotalCount", searchValue);
	}
	
	
	
	public int getTotalCount(String evcategory_idx) {
		return ss.selectOne("userBbs.totalCount", evcategory_idx);
	}
	
	//기본키를 인자로 하여 원글 검색
	public BbsVO getBbs(String evcbbs_idx) {
		return ss.selectOne("userBbs.getBbs", evcbbs_idx);
	}
	
	//쓰기
	public int add(BbsVO vo) {
		return ss.insert("userBbs.add", vo);
	}
	
	//댓글
	public int addAns(CommentVO vo) {
		return ss.insert("userBbs.addAns", vo);
		
	}
	
	//수정
	public int edit(BbsVO vo) {
		return ss.update("userBbs.edit", vo);
	}
	//삭제
	public int delBbs(String evcbbs_idx) {
		return ss.update("userBbs.del", evcbbs_idx);
	}
	
	//댓글삭제
	public int commDel(String evccomment_idx) {
		return ss.update("userBbs.commDel",evccomment_idx);
	}
	
	//조회수
	public int updateHit(String evcbbs_idx) {
		return ss.update("userBbs.hit", evcbbs_idx);
		
	}
	
	
	
	
}












