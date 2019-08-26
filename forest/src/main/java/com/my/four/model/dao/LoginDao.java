package com.my.four.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.my.four.model.dto.LoginDto;

public interface LoginDao {
	
	String namespace="login.";
	
	public List<LoginDto> allMember();
	public boolean idChk(String id);
	public int memberInsert(LoginDto dto);
	public boolean snsChk(String id);
	public LoginDto login(String id);
	public LoginDto pwChk(String pwChk);
	public LoginDto memberInfo(String id);
	public int memberUpdate(LoginDto dto);
	public int pwUpdate(String pw,String id);
	public LoginDto findId(String name, String email);
	public LoginDto findPw(String id, String email);
	public boolean joinDate(String joinDate);
	public int perpay(String id);
}
