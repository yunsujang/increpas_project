package ev.vo;

public class StockPriceVO {

	String yesterdayPrice;
	String sigaPrice;
	
	public StockPriceVO() {
		
	}
	
	public StockPriceVO(String yesterdayPrice, String sigaPrice) {
		super();
		this.yesterdayPrice = yesterdayPrice;
		this.sigaPrice = sigaPrice;
	}
	
	
	public String getYesterdayPrice() {
		return yesterdayPrice;
	}
	public void setYesterdayPrice(String yesterdayPrice) {
		this.yesterdayPrice = yesterdayPrice;
	}
	public String getSigaPrice() {
		return sigaPrice;
	}
	public void setSigaPrice(String sigaPrice) {
		this.sigaPrice = sigaPrice;
	}
	
}
