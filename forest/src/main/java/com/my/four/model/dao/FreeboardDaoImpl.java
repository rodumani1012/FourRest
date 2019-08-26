package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.FreeboardDto;
import com.my.four.model.dto.FreecommentDto;
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
		} catch (Exception e) {
			System.out.println("listerror");
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
			System.out.println("detailerror");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int freeupdate(int free_seq, String title, String content) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int res = 0;
		
		map.put("free_seq", free_seq);
		map.put("title", title);
		map.put("content", content);
		
		try {
			res =  sqlSession.update(namespace + "freeupdate", map);
		} catch (Exception e) {
			System.out.println("updateerror");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int freedelete(int free_seq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		int res = 0;
		
		map.put("free_seq", free_seq);
		
		try {
			res = sqlSession.delete(namespace + "freedelete", map);
		} catch (Exception e) {
			System.out.println("deleteerror");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int freeinsert(FreeboardDto dto) {
		
		int res = 0;

		try {
			res =  sqlSession.insert(namespace + "freeinsert", dto);
		} catch (Exception e) {
			System.out.println("inserterror");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<FreecommentDto> freecommentList(int free_seq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<FreecommentDto> list = new ArrayList<FreecommentDto>();
		
		map.put("free_seq", free_seq);
		
		try {
			list = sqlSession.selectList(namespace + "freecommentList", map);
		} catch (Exception e) {
			System.out.println("freecommentListerror");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int commentinsert(int free_seq, String user_id, String content) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int res = 0;

		map.put("free_seq", free_seq);
		map.put("user_id", user_id);
		map.put("content", content);
		
		try {
			res = sqlSession.insert(namespace + "commentinsert", map);
		} catch (Exception e) {
			System.out.println("commentinserterror");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int commdelete(int comm_seq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		int res = 0;
		
		map.put("comm_seq", comm_seq);
		
		try {
			res = sqlSession.delete(namespace + "commdelete", map);
		} catch (Exception e) {
			System.out.println("commdeleteerror");
			e.printStackTrace();
		}
		
		return res;
	}

}
