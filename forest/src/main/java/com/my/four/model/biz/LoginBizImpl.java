package com.my.four.model.biz;

import java.util.List;
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
		return dao.idChk(id);
	}

	@Override
	public int memberInsert(LoginDto dto) {
		return dao.memberInsert(dto);
	}

	@Override
	public boolean snsChk(String id) {
		return dao.snsChk(id);
	}

	@Override
	public LoginDto login(String id) {
		System.out.println(dao);
		return dao.login(id);
	}

	@Override
	public LoginDto pwChk(String pwChk) {
		return dao.pwChk(pwChk);
	}

	@Override
	public LoginDto memberInfo(String id) {
		return dao.memberInfo(id);
	}

	@Override
	public int memberUpdate(LoginDto dto) {
		return dao.memberUpdate(dto);
	}

	@Override
	public int pwUpdate(String pw,String id) {
		return dao.pwUpdate(pw,id);
	}

	@Override
	public LoginDto findId(String name, String email) {
		return dao.findId(name, email);
	}

	@Override
	public LoginDto findPw(String id, String email) {
		return dao.findPw(id, email);
	}

	@Override
	public boolean joinDate(String joinDate) {
		return dao.joinDate(joinDate);
	}

	@Override
	public List<LoginDto> allMember() {
		return dao.allMember();
	}

	@Override
	public int perPay(String id) {
		return dao.perpay(id);
	}

	public List<LoginDto> memlist() {
		return dao.memlist();
	}

	@Override
	public int memupdate(LoginDto dto) {
		return dao.memupdate(dto);
	}

	@Override
	public int memcount() {
		return dao.memcount();
	}

	@Override
	public List<LoginDto> adminsearch(String idsearch) {
		return dao.adminsearch(idsearch);
	}

	@Override
	public int userdel(int usernum) {
		return dao.userdel(usernum);
	}

	public int withdrawMember(String id) {
		return dao.withdrawMember(id);
	}
	
	
}
