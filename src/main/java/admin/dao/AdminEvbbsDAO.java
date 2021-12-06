package admin.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ev.vo.BbsVO;

@Component
public class AdminEvbbsDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	// 원하는 페이지의 게시물 목록 가져오기
	public BbsVO[] getList(int begin, int end) {
		BbsVO[]ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end",  String.valueOf(end));
		
		List<BbsVO> list = ss.selectList("bbs.Adminlist",map);
		
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}

	//기본키를 인자로 하여 원글 검색
	public BbsVO getBbs(String evbbs_idx) {
		return ss.selectOne("bbs.AdmingetBbs", evbbs_idx);
	}
	
	public int add(BbsVO vo) {
		return ss.insert("bbs.Adminadd", vo);
	}
	
	public int edit(BbsVO vo) {
		return ss.update("bbs.Adminedit", vo);
	}
	
	public int delBbs(String evbbs_idx) {
		return ss.update("bbs.Admindel", evbbs_idx);
	}
	
	public int totalCount() {
		return ss.selectOne("bbs.AdmintotalCount");
	}
	
	public BbsVO[] categoryIdxToList(String begin, String end,String idx) {
		BbsVO[]ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end",  String.valueOf(end));
		map.put("evcategory_idx", idx);
		List<BbsVO> list = ss.selectList("bbs.categoryIdxToList", map);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	public int ajaxTotalList(String idx) {
		return ss.selectOne("bbs.ajaxTotalList", idx);
	}
	
	//게시판 삭제 시 해당 게시판의 게시물 삭제
	public int AdmindeleteBbs(String name) {
		return ss.update("bbs.AdmindeleteBbs", name);
	}
	
	public int ajaxTotalList2(String name) {
		return ss.selectOne("bbs.ajaxTotalList2", name);
	}
	

}