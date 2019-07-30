package com.my.four.model.biz;

import com.my.four.model.dto.LoginDto;

public interface LoginBiz {
	
	public int joinMember(LoginDto dto);  
	public boolean idChk(String id);
}
