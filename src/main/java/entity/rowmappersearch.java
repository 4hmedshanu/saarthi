package entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class rowmappersearch implements RowMapper<searchform> {

	@Override
	public searchform mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		searchform se=new searchform();
		se.setRoute_id(rs.getInt(1));
		se.setFrom(rs.getString(2));
		se.setTo(rs.getString(3));
		se.setDistance_km(rs.getInt(4));
		se.setRoute_code(rs.getString(5));
		se.setDepot_id(rs.getInt(6));
		se.setRoute_name(rs.getString(7));
		se.setStart_time(rs.getString(8));
		se.setArrival_time(rs.getString(9));
		return se;
	}
	
	
}
