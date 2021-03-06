package com.my.four.model.dao;

import java.util.HashMap;
import java.util.List;
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
		System.out.println("111111111id"+id);
		map.put("id", id);
		dto=sqlSesssion.selectOne(namespace+"memberInfo", id);
		System.out.println("11111111111111"+dto.getEnabledDb());
		return dto;
	}

	@Override
	public int memberUpdate(LoginDto dto) {
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

	@Override
	public LoginDto findPw(String id, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return sqlSesssion.selectOne(namespace+"findPw", map);
	}

	@Override
	public boolean joinDate(String joinDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("joinDate", joinDate);
		LoginDto dto = new LoginDto();
		dto=sqlSesssion.selectOne(namespace+"joinDate", map);
		if(dto==null) {
			return false;
		}else {
			return true;
		}
		 
	}

	@Override
	public List<LoginDto> allMember() {
		return sqlSesssion.selectList(namespace+"allMember");
	}

	@Override
	public int perpay(String id) {
		
		return sqlSesssion.update(namespace+"perPay", id);
	}


	public List<LoginDto> memlist() {
		List<LoginDto> list = null;
		try {
			list = sqlSesssion.selectList(namespace+"memlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int memupdate(LoginDto dto) {
		int res =0;
		try {
			res = sqlSesssion.update(namespace+"memupdate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int memcount() {
		int cnt = 0;
		try {
			cnt = sqlSesssion.selectOne(namespace+"memcount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<LoginDto> adminsearch(String idsearch) {
		List<LoginDto> list = null;
		Map<String,String> map = new HashMap<String,String>();
		map.put("idsearch", idsearch);
		try {
			list = sqlSesssion.selectList(namespace+"adminsearch",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int userdel(int usernum) {
		int res =0;
		res = sqlSesssion.delete(namespace+"adminmemdelete",usernum);
		return res;
	}

	@Override
	public int withdrawMember(String id) {
		return sqlSesssion.update(namespace+"withdraw", id);
	}

	
	
	
	
}
