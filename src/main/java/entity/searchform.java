package entity;

public class searchform {
	
	private int route_id;
	private String from ="Tanakpur";
	private String to ="dharchula";
	private int distance_km;
	private String route_code;
	private int depot_id;
	private String route_name;
	private String start_time;
	private String arrival_time;
	
//	private int start_time;
//	private int arrival_time;
	
	public int getRoute_id() {
		return route_id;
	}
	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}
	public int getDistance_km() {
		return distance_km;
	}
	public void setDistance_km(int distance_km) {
		this.distance_km = distance_km;
	}
	public String getRoute_code() {
		return route_code;
	}
	public void setRoute_code(String route_code) {
		this.route_code = route_code;
	}
	public int getDepot_id() {
		return depot_id;
	}
	public void setDepot_id(int depot_id) {
		this.depot_id = depot_id;
	}
	public String getRoute_name() {
		return route_name;
	}
	public void setRoute_name(String route_name) {
		this.route_name = route_name;
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
	
	
	
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	@Override
	public String toString() {
		return "searchform [route_id=" + route_id + ", from=" + from + ", to=" + to + ", distance_km=" + distance_km
				+ ", route_code=" + route_code + ", depot_id=" + depot_id + ", route_name=" + route_name
				+ ", start_time=" + start_time + ", arrival_time=" + arrival_time + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
