package com.my.four.model.batch;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.my.four.model.dto.LoginDto;

public class RowMapper implements org.springframework.jdbc.core.RowMapper<LoginDto>{

	@Override
	public LoginDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		LoginDto dto = new LoginDto();
		dto.setId(rs.getString("id"));
		return dto;
	}

}
