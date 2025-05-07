package entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class rowmapperstop implements RowMapper<stopage> {

	@Override
	public stopage mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		stopage stop=new stopage();
		stop.setId(rs.getInt(1));
		stop.setStop(rs.getString(2));
		stop.setKm(rs.getInt(3));
		stop.setAmt(rs.getInt(4));
		return stop;
	}

	
	
}
