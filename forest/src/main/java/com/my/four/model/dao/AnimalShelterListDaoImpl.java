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
	public List<AnimalShelterListDto> aniSelectList(int firstIndex, int recordCountPerPage,
			String txt_search) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		map.put("txt_search", txt_search);
		
		List<AnimalShelterListDto> list = sqlSession.selectList(namespace + "aniSelectList", map);
		
		return list;
	}

	@Override
	public int aniGetTotalCount(String txt_search) {
		return 0;
	}

}