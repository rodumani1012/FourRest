package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.FreeboardDto;
import com.my.four.model.dto.FundingDto;

@Repository
public class FreeboardDaoImpl implements FreeboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FreeboardDto> freeboardList() {
		
		List<FreeboardDto> list = new ArrayList<FreeboardDto>();
		
		try {
			list = sqlSession.selectList(namespace + "freeboardList");
			//System.out.println(list);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public FreeboardDto freedetail(int free_seq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		FreeboardDto dto = new FreeboardDto();
		
		map.put("free_seq", free_seq);
		
		try {
			dto = sqlSession.selectOne(namespace + "freedetail", map);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		return dto;
	}

}
