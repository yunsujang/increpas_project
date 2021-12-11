
package ev.vo;

import java.util.List;

public class CategoryVO {
	private String evcategory_idx, evcategory_name, evcategory_status, evcategory_type;
	private List<BbsVO> b_list;
	
	private String changeIdx;
	private String changeName;

	public String getChangeIdx() {
		return changeIdx;
	}
 
	public void setChangeIdx(String changeIdx) {
		this.changeIdx = changeIdx;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getEvcategory_idx() {
		return evcategory_idx;
	}

	public void setEvcategory_idx(String evcategory_idx) {
		this.evcategory_idx = evcategory_idx;
	}

	public String getEvcategory_name() {
		return evcategory_name;
	}

	public void setEvcategory_name(String evcategory_name) {
		this.evcategory_name = evcategory_name;
	}

	public String getEvcategory_status() {
		return evcategory_status;
	}

	public void setEvcategory_status(String evcategory_status) {
		this.evcategory_status = evcategory_status;
	}

	public String getEvcategory_type() {
		return evcategory_type;
	}

	public void setEvcategory_type(String evcategory_type) {
		this.evcategory_type = evcategory_type;
	}

	public List<BbsVO> getB_list() {
		return b_list;
	}

	public void setB_list(List<BbsVO> b_list) {
		this.b_list = b_list;
	}

}
