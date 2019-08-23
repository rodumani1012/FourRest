package com.my.four.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.my.four.model.dto.AnimalDisturbDto;
import com.my.four.model.dto.AnimalEndangeredCSVDto;
import com.my.four.model.dto.AnimalEndangeredImgDto;
import com.my.four.model.dto.AnimalEndangeredJoinDto;
import com.my.four.model.dto.AnimalHarmDto;
import com.my.four.model.dto.AnimalShelterListDto;

@Repository
public class AnimalListDaoImpl implements AnimalListDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MongoTemplate mongoTemplate;
	
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
		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("firstIndex", String.valueOf(firstIndex));
//		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
//		map.put("txt_search", txt_search);
//		
//		List<AnimalShelterListDto> list = sqlSession.selectList(namespace + "aniSelectList", map);
//		
//		return list;
		List<AnimalShelterListDto> list = mongoTemplate.findAll(AnimalShelterListDto.class, "shelter");
		for(AnimalShelterListDto dto : list) {
			System.out.print(dto.getArea());
		}
		System.out.println();
		return list;
	}

	@Override
	public int aniGetTotalCount(String txt_search) {
		
//		int res = 0;
//		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("txt_search", txt_search);
//		
//		res = sqlSession.selectOne(namespace + "aniGetTotalCount", map);
//
//		return res;
		int res = 0;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("centerName").regex(txt_search));
		
		res = (int) mongoTemplate.count(query, AnimalShelterListDto.class, "shelter");
		System.out.println("갯수 : " + res);
		return res;
	}

	@Transactional
	@Override
	public int aniInsertEndangeredCSV(List<AnimalEndangeredCSVDto> dtos) {

		int res = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dtos);
		
		res = sqlSession.insert(namespace + "aniInsertEndangeredCSV", map);
		
		return res;
	}

	@Override
	public int aniGetTotalCountEndangeredCSV(String txt_search) {

		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("txt_search", txt_search);
		
		res = sqlSession.selectOne(namespace + "aniGetTotalCountEndangeredCSV", map);
		
		return res;
	}

	@Transactional
	@Override
	public int aniInsertEndangeredImg(List<AnimalEndangeredImgDto> dtos) {

		int res = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dtos);
		
		res = sqlSession.insert(namespace + "aniInsertEndangeredImg", map);
		
		return res;
	}

	@Override
	public List<AnimalEndangeredJoinDto> aniSelectListEndangeredJoin() {
		
		List<AnimalEndangeredJoinDto> list = sqlSession.selectList(namespace + "joinToSave");
		
		return list;
	}
	
	@Override
	public List<AnimalEndangeredJoinDto> aniSelectListEndangeredJoin(int firstIndex, int recordCountPerPage,
			String txt_search) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		map.put("txt_search", txt_search);
		
		List<AnimalEndangeredJoinDto> list = sqlSession.selectList(namespace + "join", map);
		
		return list;
	}

	@Transactional
	@Override
	public int aniInsertEndangeredJoin(List<AnimalEndangeredJoinDto> dtos) {

		int res = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dtos);
		
		res = sqlSession.insert(namespace + "aniInsertEndangeredJoin", map);
		
		return res;
	}
	
	@Override
	public int aniGetTotalCountEndangeredJoin(String txt_search) {

		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("txt_search", txt_search);
		
		res = sqlSession.selectOne(namespace + "aniGetTotalCountEndangeredJoin", map);
		
		return res;
	}

	@Override
	public int aniGetOne(String grade, String groups) {
		
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("grade", grade);
		map.put("groups", groups);
		
		res = sqlSession.selectOne(namespace + "aniGetOne", map);
		
		return res;
	}

	@Override
	public int aniGetTotalCountDisturbHarm(String board) {

		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("board", board);
		
		res = sqlSession.selectOne(namespace + "aniGetTotalCountDHDb", map);
		
		return res;
	}
	
	@Override
	public int aniGetTotalCountDisturbHarm(String groups, String board, String txt_search) {
		
		int res = 0;

		Map<String, String> map = new HashMap<String, String>();
		map.put("board", board);

		if(txt_search == null || txt_search.equals("")) {
			map.put("txt_search", null);
		} else {
			map.put("txt_search", txt_search);
		}
		if(!groups.equals("all")) {
			map.put("groups", groups);
		} else {
			map.put("groups", null);
		}
		
//		Set<Entry<String, String>>entry = map.entrySet();
//		for(Entry<String, String> e : entry) {
//			System.out.println(e.getKey() + " : "+ e.getValue());
//		}
		
		res = sqlSession.selectOne(namespace + "aniGetTotalCountDisturbHarm", map);

		return res;
	}

	@Transactional
	@Override
	public int aniInsertDisturbHarm(String board, Object dtos) {
		
		int res = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", board);
		if (board.equals("animal_alien_disturb")) {
			map.put("list",(List<AnimalDisturbDto>) dtos);
		} else {
			map.put("list",(List<AnimalHarmDto>) dtos);
		}
		res = sqlSession.insert(namespace + "aniInsertDisturbHarm", map);
		
		return res;
	}

	@Override
	public List<AnimalDisturbDto> aniSelectListDisturb(String groups, int firstIndex, int recordCountPerPage, String txt_search) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		if (txt_search.length() < 1) {
			map.put("txt_search", null);
		} else {
			map.put("txt_search", txt_search);
		}
		if(!groups.equals("all")) {
			map.put("groups", groups);
		} else {
			map.put("groups", null);
		}
		
		List<AnimalDisturbDto> list = sqlSession.selectList(namespace + "aniSelectListDisturb", map);
		
//		Set<Entry<String, String>>entry = map.entrySet();
//		for(Entry<String, String> e : entry) {
//			System.out.println(e.getKey() + " : "+ e.getValue());
//		}
//		
//		for(AnimalDisturbDto dto : list) {
//			System.out.println(dto.getKor_name());
//		}

		return list;
	}

	@Override
	public List<AnimalHarmDto> aniSelectListHarm(String groups, int firstIndex, int recordCountPerPage, String txt_search) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		if (txt_search.length() < 1) {
			map.put("txt_search", null);
		} else {
			map.put("txt_search", txt_search);
		}
		if(!groups.equals("all")) {
			map.put("groups", groups);
		} else {
			map.put("groups", null);
		}
		
		List<AnimalHarmDto> list = sqlSession.selectList(namespace + "aniSelectListHarm", map);
		
		return list;
	}
}
