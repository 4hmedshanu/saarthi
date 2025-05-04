package entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class resultset implements RowMapper<userdata> {

	@Override
	public userdata mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		userdata us=new userdata();
		us.setFull_name(rs.getString(2));
		us.setEmail_id(rs.getString(3));
		us.setPasswored(rs.getString(4));
		us.setUsername(rs.getString(5));
		return us;
	}
	
	
}
