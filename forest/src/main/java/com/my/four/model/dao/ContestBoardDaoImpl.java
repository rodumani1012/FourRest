package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.ContestBoardDto;
@Repository
public class ContestBoardDaoImpl implements ContestBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ContestBoardDto> selectList(int begin, int end) {
		List<ContestBoardDto> list = new ArrayList<ContestBoardDto>();
		Map<String,Integer> map = new HashMap<String ,Integer>();
		map.put("begin", begin);
		map.put("end", end);
		try {
			list = sqlSession.selectList(namespace+"selectList",map);
		} catch (Exception e) {
			System.out.println("여기에러어");
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	@Override
	public ContestBoardDto selectOne(int boardno) {
		ContestBoardDto dto = null;
		dto = sqlSession.selectOne(namespace+"selectOne",boardno);
		
		return dto;
	}

	@Override
	public int boardInsert(ContestBoardDto dto) {
		int res =0;
		try {
			res = sqlSession.insert(namespace+"boardInsert",dto);
		} catch (Exception e) {
			System.out.println("에러다!");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int boardUpdate(ContestBoardDto dto) {
		int res =0;
		try {
			res = sqlSession.update(namespace+"boardUpdate",dto);
		} catch (Exception e) {
			System.out.println("에러다!");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int boardDelete(int groupno) {
		int res=0;
		res = sqlSession.delete(namespace+"delete",groupno);
		return 0;
	}

	@Override
	public int boardDel(int boardno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDeleteReply(int boardno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAns(int parentno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAns(ContestBoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalCount() {
		int cnt =0;
		try {
			cnt = sqlSession.selectOne(namespace+"selectTotalCount");
		} catch (Exception e) {
			System.out.println("에러남 토탈카운트");
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ContestBoardDto> selectListOption(int opt, String condition, int begin, int end) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContestBoardDto> selectListReply(int groupno) {
		List<ContestBoardDto> list = new ArrayList<ContestBoardDto>();
		try {
			list = sqlSession.selectList(namespace+"selectListReply",groupno);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public int replyCntup(int boardno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int likeCntup(int boardno) {
		int res =0;
		try {
			res = sqlSession.update(namespace+"likeCntup",boardno);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int answProc(ContestBoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ContestBoardDto> selectThree() {
		List<ContestBoardDto> threelist = null;
		try {
			threelist = sqlSession.selectList(namespace+"selectThree");
		} catch (Exception e) {
			System.out.println("에러다!");
			e.printStackTrace();
		}
		return threelist;
	}



}
