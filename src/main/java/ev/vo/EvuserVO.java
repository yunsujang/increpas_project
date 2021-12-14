package ev.vo;

public class EvuserVO {

	private String evu_idx,
					evu_id,
					evu_pw,
					evu_name,
					evu_email,
					evu_phone,
					evu_who,
					evu_status,
					evu_comp;

	public EvuserVO(String evu_id, String evu_pw, String evu_name, String evu_email, String evu_phone, String evu_comp) {
		this.evu_id = evu_id;
		this.evu_pw = evu_pw;
		this.evu_name = evu_name;
		this.evu_email = evu_email;
		this.evu_phone = evu_phone;
		this.evu_comp = evu_comp;
	}
	
	public String getEvu_idx() {
		return evu_idx;
	}
	


	public void setEvu_idx(String evu_idx) {
		this.evu_idx = evu_idx;
	}
 
	public String getEvu_id() {
		return evu_id;
	}

	public void setEvu_id(String evu_id) {
		this.evu_id = evu_id;
	}

	public String getEvu_pw() {
		return evu_pw;
	}

	public void setEvu_pw(String evu_pw) {
		this.evu_pw = evu_pw;
	}

	public String getEvu_name() {
		return evu_name;
	}

	public void setEvu_name(String evu_name) {
		this.evu_name = evu_name;
	}

	public String getEvu_email() {
		return evu_email;
	}

	public void setEvu_email(String evu_email) {
		this.evu_email = evu_email;
	}

	public String getEvu_phone() {
		return evu_phone;
	}

	public void setEvu_phone(String evu_phone) {
		this.evu_phone = evu_phone;
	}

	public String getEvu_who() {
		return evu_who;
	}

	public void setEvu_who(String evu_who) {
		this.evu_who = evu_who;
	}

	public String getEvu_status() {
		return evu_status;
	}

	public void setEvu_status(String evu_status) {
		this.evu_status = evu_status;
	}

	public String getEvu_comp() {
		return evu_comp;
	}

	public void setEvu_comp(String evu_comp) {
		this.evu_comp = evu_comp;
	}

}
