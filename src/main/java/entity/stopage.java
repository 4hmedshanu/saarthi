package entity;

public class stopage {
	private int id;
	private String stop;
	private int km;
	private int Amt;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStop() {
		return stop;
	}
	public void setStop(String stop) {
		this.stop = stop;
	}
	public int getKm() {
		return km;
	}
	public void setKm(int km) {
		this.km = km;
	}
	public int getAmt() {
		return Amt;
	}
	public void setAmt(int amt) {
		Amt = amt;
	}
	
	
	
	@Override
	public String toString() {
		return "stopage [id=" + id + ", stop=" + stop + ", km=" + km + ", Amt=" + Amt + "]";
	}
	
	
	
	
	
	

}
