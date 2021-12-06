package mybatis.vo;

public class EleVO {
	//전기차 충전소 공공데이터 오픈 api VO
	private String busiNm,
	note,	 
	parkingFree,
	stat, 	
	busiCall, 
	limitYn,	
	useTime,	
	lat,	
	lng,	
	addr,	
	chgerType,	
	statNm,
	statId,	
	chgerId,
	location;
	
	public EleVO() {}
	
	
	
	
	
	public EleVO(String limitYn, String note, String parkingFree, String stat, String busiCall, String busiNm,
			String useTime, String lat, String lng, String addr, String chgerType, String statNm, String statId,
			String chgerId, String location) {
		super();
		this.limitYn = limitYn;
		this.note = note;
		this.parkingFree = parkingFree;
		this.stat = stat;
		this.busiCall = busiCall;
		this.busiNm = busiNm;
		this.useTime = useTime;
		this.lat = lat;
		this.lng = lng;
		this.addr = addr;
		this.chgerType = chgerType;
		this.statNm = statNm;
		this.statId = statId;
		this.chgerId = chgerId;
		this.location = location;
	}





	public String getLocation() {
		return location;
	}





	public void setLocation(String location) {
		this.location = location;
	}





	public String getLimitYn() {
		return limitYn;
	}

	public void setLimitYn(String limitYn) {
		this.limitYn = limitYn;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getParkingFree() {
		return parkingFree;
	}

	public void setParkingFree(String parkingFree) {
		this.parkingFree = parkingFree;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getBusiCall() {
		return busiCall;
	}

	public void setBusiCall(String busiCall) {
		this.busiCall = busiCall;
	}

	public String getBusiNm() {
		return busiNm;
	}

	public void setBusiNm(String busiNm) {
		this.busiNm = busiNm;
	}

	public String getUseTime() {
		return useTime;
	}

	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getChgerType() {
		return chgerType;
	}

	public void setChgerType(String chgerType) {
		this.chgerType = chgerType;
	}

	public String getStatNm() {
		return statNm;
	}

	public void setStatNm(String statNm) {
		this.statNm = statNm;
	}

	public String getStatId() {
		return statId;
	}

	public void setStatId(String statId) {
		this.statId = statId;
	}

	public String getChgerId() {
		return chgerId;
	}

	public void setChgerId(String chgerId) {
		this.chgerId = chgerId;
	}
	
	
	
}
