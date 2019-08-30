package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.CalendarDto;
import com.my.four.model.dto.VolmemberDto;

@Repository
public class CalendarDaoImpl implements CalendarDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CalendarDto> selectList() {
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			list = sqlSession.selectList(namespace + "selectList");
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public CalendarDto selectOne(int seq) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		CalendarDto dto = new CalendarDto();
		
		map.put("seq", seq);
		try {
			dto = sqlSession.selectOne(namespace + "selectOne", seq);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int volinsert(String caltitle, String id) {
		
		Map<String, String> map = new HashMap<String, String>();
		int res = 0;
		
		map.put("caltitle", caltitle);
		map.put("id", id);
		
		try {
			res = sqlSession.insert(namespace + "volInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int voldelete(String caltitle, String id) {
		
		Map<String, String> map = new HashMap<String, String>();
		int res = 0;
		
		map.put("caltitle", caltitle);
		map.put("id", id);
		
		try {
			res = sqlSession.delete(namespace + "volDelete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<VolmemberDto> volList(String caltitle) {
		
		List<VolmemberDto> list = new ArrayList<VolmemberDto>();
		
		try {
			list = sqlSession.selectList(namespace + "volList", caltitle);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int calinsert(CalendarDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "calinsert", dto);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int caldelete(String caltitle, String id) {
		Map<String, String> map = new HashMap<String, String>();
		int res = 0;
		
		map.put("caltitle", caltitle);
		map.put("id", id);
		
		try {
			res = sqlSession.delete(namespace + "caldelete", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int volupdate(String caltitle, String id) {
		Map<String, String> map = new HashMap<String, String>();
		int res = 0;
		
		map.put("caltitle", caltitle);
		map.put("id", id);
		
		try {
			res = sqlSession.delete(namespace + "volupdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public VolmemberDto volselectOne(String caltitle, String id) {
		
		VolmemberDto dto = new VolmemberDto();
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("caltitle", caltitle);
		map.put("id", id);
		
		try {
			dto = sqlSession.selectOne(namespace + "volselectOne", map);
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int noticeupdate(String today) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "noticeupdate", today);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int noticeupdate1(List<String> list) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int res = 0;
		map.put("list", list);
		
		try {
			res = sqlSession.update(namespace + "noticeupdate1", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int calcount() {
		int res =0;
		try {
			res = sqlSession.selectOne(namespace+"calcount");
		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		return res;
	}

}
