package com.my.four.model.biz;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.my.four.model.dto.LoginDto;

public interface LoginBiz {

	public boolean idChk(String id);
	public int memberInsert(LoginDto dto);
	public boolean snsChk(String id);
	public LoginDto login(String id);
}
