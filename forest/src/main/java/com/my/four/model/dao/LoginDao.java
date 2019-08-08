package com.my.four.model.dao;

import java.util.Map;

import com.my.four.model.dto.LoginDto;

public interface LoginDao {
	
	String namespace="login.";
	

	public boolean idChk(String id);
	public int memberInsert(LoginDto dto);
	public boolean snsChk(String id);
	public LoginDto login(String id);
}
