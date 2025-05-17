package entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class rowmapperlive implements RowMapper<live> {

	@Override
	public live mapRow(ResultSet rs, int rowNum) throws SQLException {
		live se=new live();
		se.setId(rs.getInt(1));
		se.setBusnumber(rs.getString(2));
		se.setBustype(rs.getString(3));
		se.setTotal_seats(rs.getInt(4));
		se.setDriver_name(rs.getString(5));
		se.setConductor_name(rs.getString(6));
		
		
		return se;
	}

}
