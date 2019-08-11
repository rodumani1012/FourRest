package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.my.four.model.dto.TrashDto;

public class TrashDaoImpl implements TrashDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TrashDto> trashList() {
		List<TrashDto> list = new ArrayList<TrashDto>();
		list=sqlSession.selectList(namespace+"trashList");
		return list;
	}

	@Override
	public int trashInsert(String imgRef, String trashName, String trashLife) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("imgRef", imgRef);
		map.put("trashName", trashName);
		map.put("trashLife",trashLife);
		return sqlSession.insert(namespace+"trashInsert",map);
	}
	

}
