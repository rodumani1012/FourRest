package com.my.four.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.my.four.model.dto.AreaDto;
@Repository
public class PollutionDataDaoImpl implements PollutionDataDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	@Override
	public int inserttrash(List<AreaDto> list) {
		int res =0;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		res = sqlSession.insert(namespace+"trashdb",map);
		return res;
	}

	@Override
	public int insertwater(List<AreaDto> list) {
		int res =0;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		res = sqlSession.insert(namespace+"waterdb",map);
		
		return res;
	}

	@Override
	public int insertair(List<AreaDto> list) {
		int res =0;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		res = sqlSession.insert(namespace+"airdb",map);
		return res;
	}

	@Override
	public boolean istrashin() {
		int cnt =0;
		cnt = sqlSession.selectOne(namespace+"trashin");
		if(cnt>0)
			return true;
		return false;
	}

	@Override
	public boolean iswaterin() {
		int cnt =0;
		cnt = sqlSession.selectOne(namespace+"waterin");
		if(cnt>0)
			return true;
		return false;
	}

	@Override
	public boolean isairin() {
		int cnt =0;
		cnt = sqlSession.selectOne(namespace+"airin");
		if(cnt>0)
			return true;
		return false;
	}

	@Override
	public List<AreaDto> selectBigList(int bigOption, int miniOption) {
		List<AreaDto> biglist = null;
		Map<String,Integer> map = new HashMap<String,Integer>();
		String year = "201"+miniOption;
		int repyear = Integer.parseInt(year);
		System.out.println("여기가 ! "+bigOption+"/"+repyear);
		map.put("bigOption",bigOption);
		map.put("repyear", repyear);
		biglist = sqlSession.selectList(namespace+"bigchart",map);
		
		return biglist;
	}

	@Override
	public List<AreaDto> selectMiniList(int bigOption, String areaname) {
		List<AreaDto> minilist = null;
		Map<String,Object> map = new HashMap<String,Object>();
		if(areaname.length()!=4) {
			areaname=areaname.substring(0, 2);
		}else {
			areaname = areaname.substring(0,1)+areaname.substring(2,3);
		}
		map.put("bigOption", bigOption);
		map.put("areaname", areaname);
		minilist = sqlSession.selectList(namespace+"minichart", map);
		return minilist;
	}

}
