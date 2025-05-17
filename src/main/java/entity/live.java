package entity;

public class live {
	private int id=0;
	private String busnumber;
	private String bustype;
	private int total_seats;
	private String driver_name;
	private String conductor_name;
	private String registration_date;
	private String last_date;
	private int depot_id;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBusnumber() {
		return busnumber;
	}
	public void setBusnumber(String busnumber) {
		this.busnumber = busnumber;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public int getTotal_seats() {
		return total_seats;
	}
	public void setTotal_seats(int total_seats) {
		this.total_seats = total_seats;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public String getConductor_name() {
		return conductor_name;
	}
	public void setConductor_name(String conductor_name) {
		this.conductor_name = conductor_name;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	public String getLast_date() {
		return last_date;
	}
	public void setLast_date(String last_date) {
		this.last_date = last_date;
	}
	public int getDepot_id() {
		return depot_id;
	}
	public void setDepot_id(int depot_id) {
		this.depot_id = depot_id;
	}
	@Override
	public String toString() {
		return "live [id=" + id + ", busnumber=" + busnumber + ", bustype=" + bustype + ", total_seats=" + total_seats
				+ ", driver_name=" + driver_name + ", conductor_name=" + conductor_name + ", registration_date="
				+ registration_date + ", last_date=" + last_date + ", depot_id=" + depot_id + "]";
	}
	
	
	
	
	
	
}
