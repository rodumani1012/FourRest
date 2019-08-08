package com.my.four.model.biz;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.LoginDao;
import com.my.four.model.dto.LoginDto;
@Service
public class LoginBizImpl implements LoginBiz{
	
	@Autowired
	private LoginDao dao;
	

	@Override
	public boolean idChk(String id) {
		// TODO Auto-generated method stub
		return dao.idChk(id);
	}

	@Override
	public int memberInsert(LoginDto dto) {
		// TODO Auto-generated method stub
		return dao.memberInsert(dto);
	}

	@Override
	public boolean snsChk(String id) {
		// TODO Auto-generated method stub
		return dao.snsChk(id);
	}

	@Override
	public LoginDto login(String id) {
		System.out.println(dao);
		return dao.login(id);
	}
	
	
}
