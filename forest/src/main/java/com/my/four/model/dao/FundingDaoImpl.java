package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.FundingDto;

@Repository
public class FundingDaoImpl implements FundingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FundingDto> selectList() {
		
		List<FundingDto> list = new ArrayList<FundingDto>();
		
		try {
			list = sqlSession.selectList(namespace + "selectList");
			//System.out.println(list);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public FundingDto selectOne(String funtitle) {
		
		FundingDto dto = new FundingDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "selectOne", funtitle);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(FundingDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(FundingDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "update", dto);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(String id) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "delete", id);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int muldel(String[] chk) {
		int res = 0;
		List<String> list = new ArrayList<String>();
		
		for(String i : chk) {
			list.add(i);
		}
		
		res = sqlSession.delete(namespace + "muldel", list);
		
		return res;
	}

}
