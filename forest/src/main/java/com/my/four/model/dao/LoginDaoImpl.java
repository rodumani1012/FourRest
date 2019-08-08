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
		int res1 = sqlSesssion.insert(namespace+"insert_auth",dto); 
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
	
	
	
	
}
