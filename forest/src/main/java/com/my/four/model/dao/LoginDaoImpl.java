package com.my.four.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.LoginDto;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate sqlSesssion;

	@Override
	public int joinMember(LoginDto dto) {
		int res = sqlSesssion.insert(namespace+"insert",dto);
		return res;
	}

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
	
	
	
}
