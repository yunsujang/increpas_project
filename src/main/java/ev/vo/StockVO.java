package ev.vo;

public class StockVO {

	private String name, NowPrice, vsyesterday, DungRakrate, 
					HighPrice, LowPrice, georaeryang, TradingValue;
	
	public StockVO() {
		
	}
 
	public StockVO(String name, String nowPrice, String vsyesterday, String dungRakrate, String highPrice,
			String lowPrice, String georaeryang, String tradingValue) {
		super();
		this.name = name;
		this.NowPrice = nowPrice;
		this.vsyesterday = vsyesterday;
		this.DungRakrate = dungRakrate;
		this.HighPrice = highPrice;
		this.LowPrice = lowPrice;
		this.georaeryang = georaeryang;
		this.TradingValue = tradingValue;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNowPrice() {
		return NowPrice;
	}

	public void setNowPrice(String nowPrice) {
		this.NowPrice = nowPrice;
	}

	public String getVsyesterday() {
		return vsyesterday;
	}

	public void setVsyesterday(String vsyesterday) {
		this.vsyesterday = vsyesterday;
	}

	public String getDungRakrate() {
		return DungRakrate;
	}

	public void setDungRakrate(String dungRakrate) {
		this.DungRakrate = dungRakrate;
	}

	public String getHighPrice() {
		return HighPrice;
	}

	public void setHighPrice(String highPrice) {
		this.HighPrice = highPrice;
	}

	public String getLowPrice() {
		return LowPrice;
	}

	public void setLowPrice(String lowPrice) {
		this.LowPrice = lowPrice;
	}

	public String getGeoraeryang() {
		return georaeryang;
	}

	public void setGeoraeryang(String georaeryang) {
		this.georaeryang = georaeryang;
	}

	public String getTradingValue() {
		return TradingValue;
	}

	public void setTradingValue(String tradingValue) {
		this.TradingValue = tradingValue;
	}
	
	
	
}
