package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.my.four.model.dto.TrashDto;

@Repository
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
	public int trashCount() {
		return sqlSession.selectOne(namespace+"trashGetTotalCount");
	}

	@Override
	public int trashInsert(List<TrashDto> trashCrawling) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(trashCrawling.get(0).getImgRef());
		System.out.println(trashCrawling.get(0).getTrashName() + "ㅋㅋㅋ");
		System.out.println(trashCrawling.get(0).getTrashLife());
		map.put("trashName", trashCrawling);
	
		return sqlSession.insert(namespace+"trashInsert",map);
	}


}
