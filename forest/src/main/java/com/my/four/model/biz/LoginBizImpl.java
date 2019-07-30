package com.my.four.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.LoginDao;
import com.my.four.model.dto.LoginDto;
@Service
public class LoginBizImpl implements LoginBiz{
	
	@Autowired
	private LoginDao dao;
	
	@Override
	public int joinMember(LoginDto dto) {
		// TODO Auto-generated method stub
		return dao.joinMember(dto);
	}

	@Override
	public boolean idChk(String id) {
		// TODO Auto-generated method stub
		return dao.idChk(id);
	}
	
	
}
