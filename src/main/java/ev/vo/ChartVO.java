package ev.vo;

public class ChartVO {

	String date;
	int sise;
	
	public ChartVO(String date, int sise) {
		super();
		this.date = date;
		this.sise = sise;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getSise() {
		return sise;
	}

	public void setSise(int sise) {
		this.sise = sise;
	}
	
}
