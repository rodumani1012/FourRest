package com.my.four.model.dao;

import java.util.ArrayList;
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
	public int insert(List<AnimalShelterListDto> dtos) {

		int res = 0;
		
		Map<String, List<AnimalShelterListDto>> map = new HashMap<String, List<AnimalShelterListDto>>();
		map.put("list", dtos);
		
		res = sqlSession.insert(namespace + "insertList", map);
		
		return res;
	}

}
