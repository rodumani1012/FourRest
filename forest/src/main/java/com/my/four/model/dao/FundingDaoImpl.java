package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.FundingDto;
import com.my.four.model.dto.FundingLoadDto;

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
		Map<String, String> map = new HashMap<String, String>();
		FundingDto dto = new FundingDto();
		
		map.put("funtitle", funtitle);
		try {
			dto = sqlSession.selectOne(namespace + "selectOne", map);
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
	public int update(String funtitle, String id) {
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("funtitle", funtitle);
		map.put("id", id);
		
		try {
			res = sqlSession.update(namespace + "update", map);
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
	public int muldel(FundingDto dto, String id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		map.put("id", id);

		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "muldel", map);
		} catch (Exception e) {
			System.out.println("오류라고?");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int funupdate(String funtitle, int funmoney) {
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("funtitle", funtitle);
		map.put("funmoney", funmoney);
		
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "funupdate", map);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int funupdate1(String funtitle, int count) {
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("funtitle", funtitle);
		map.put("count", count);
		
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "funupdate1", map);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

}
