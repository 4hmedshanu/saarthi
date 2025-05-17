package entity;

public class Location {
	
    private String address;
    private String location;
    
    public Location(String address, String location) {
        this.address = address;
        this.location = location;
    }

    // Getters and setters
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    
    
    

}
