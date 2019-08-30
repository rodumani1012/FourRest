package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.LoginDto;

public interface LoginBiz {
	
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
	public LoginDto findPw(String id,String email);
	public boolean joinDate(String joinDate);
	public int perPay(String id);
	public List<LoginDto> memlist();
	public int memupdate(LoginDto dto);
	public int memcount();
	public List<LoginDto> adminsearch(String idsearch);
	public int userdel(int usernum);
	public int withdrawMember(String id);
}
