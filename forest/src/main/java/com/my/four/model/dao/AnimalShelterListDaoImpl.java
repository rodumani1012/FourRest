package com.my.four.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.my.four.model.dto.AnimalShelterListDto;

@Repository
public class AnimalShelterListDaoImpl implements AnimalShelterListDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	@Override
	public int aniInsert(List<AnimalShelterListDto> dtos) {

		int res = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dtos);
		
		res = sqlSession.insert(namespace + "aniInsert", map);
		
		return res;
	}

	@Override
	public List<AnimalShelterListDto> aniSelectList(int begin, int end) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<AnimalShelterListDto> list = sqlSession.selectList(namespace + "aniSelectList", map);
		
		return list;
	}

	@Override
	public int aniGetTotalCount() {
		int res = 0;
		
		res = sqlSession.selectOne(namespace + "aniGetTotalCount");
		
		return res;
	}

}
