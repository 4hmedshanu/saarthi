package entity;

public class searchform {
	
	private String route;
	private String from;
	private String to;
	
	
	
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	@Override
	public String toString() {
		return "searchform [route=" + route + ", from=" + from + ", to=" + to + "]";
	}
	
	
	
	
	
}
