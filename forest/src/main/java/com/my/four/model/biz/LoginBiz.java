package com.my.four.model.biz;

import com.my.four.model.dto.LoginDto;

public interface LoginBiz {

	public boolean idChk(String id);
	public int memberInsert(LoginDto dto);
}
