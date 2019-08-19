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

	@Override
	public LoginDto pwChk(String pwChk) {
		// TODO Auto-generated method stub
		return dao.pwChk(pwChk);
	}

	@Override
	public LoginDto memberInfo(String id) {
		// TODO Auto-generated method stub
		return dao.memberInfo(id);
	}

	@Override
	public int memberUpdate(LoginDto dto) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(dto);
	}

	@Override
	public int pwUpdate(String pw,String id) {
		// TODO Auto-generated method stub
		return dao.pwUpdate(pw,id);
	}

	@Override
	public LoginDto findId(String name, String email) {
		// TODO Auto-generated method stub
		return dao.findId(name, email);
	}
	
	
}
