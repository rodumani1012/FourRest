package com.my.four.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.LoginDto;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate sqlSesssion;
	

	@Override
	public boolean idChk(String id) {
		boolean idchk = false;
		LoginDto dto = new LoginDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		dto= sqlSesssion.selectOne(namespace+"idchk",map);
		if(dto==null) {
			idchk=true;
		}else {
			idchk=false;
		}
		return idchk;
	}

	@Override
	public int memberInsert(LoginDto dto) {
		int res =sqlSesssion.insert(namespace+"insert",dto);
		return res;
	}

	@Override
	public boolean snsChk(String id) {
		boolean snschk= false;
		LoginDto dto = new LoginDto();
		dto=sqlSesssion.selectOne(namespace+"idchk",id);
		if(dto==null) {
			snschk=true;
		}else {
			snschk=false;
		}
		return snschk;
	}

	
	@Override
	public LoginDto login(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		System.out.println("----------------"+id);
		LoginDto dto = new LoginDto();
		dto= sqlSesssion.selectOne(namespace+"login",map);
		return dto;
	}

	@Override
	public LoginDto pwChk(String id) {
		LoginDto dto = new LoginDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		System.out.println("-pwchk"+id);
		dto=sqlSesssion.selectOne(namespace+"pwChk", id);
		return dto;
	}

	@Override
	public LoginDto memberInfo(String id) {
		LoginDto dto = new LoginDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		dto=sqlSesssion.selectOne(namespace+"memberInfo", id);
		return dto;
	}

	@Override
	public int memberUpdate(LoginDto dto) {
		// TODO Auto-generated method stub
		return sqlSesssion.update(namespace+"memberUpdate", dto);
	}

	@Override
	public int pwUpdate(String pw,String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSesssion.update(namespace+"pwUpdate", map);
	}

	@Override
	public LoginDto findId(String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		return sqlSesssion.selectOne(namespace+"findId", map);
	}

	
	
	
	
}
