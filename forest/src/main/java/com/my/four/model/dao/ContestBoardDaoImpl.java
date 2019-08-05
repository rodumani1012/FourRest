package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.ContestBoardDto;
@Repository
public class ContestBoardDaoImpl implements ContestBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
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
	public int getCount(int conlistno) {
		int res =0;
		ContestBoardDto dto =new ContestBoardDto(conlistno);
		try {
			res = sqlSession.selectOne(namespace+"getCount",dto);
		} catch (Exception e) {
			System.out.println("에러다!?");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ContestBoardDto> selectThree(int conlistno) {
		List<ContestBoardDto> threelist = null;
		ContestBoardDto dto = new ContestBoardDto(conlistno);
		try {
			threelist = sqlSession.selectList(namespace+"selectThree",dto);
		} catch (Exception e) {
			System.out.println("에러다!??");
			e.printStackTrace();
		}
		return threelist;
	}
	
	@Override
	public List<ContestBoardDto> selectListOption(int conlistno, int begin, int end) {
		List<ContestBoardDto> listOption = null;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("conlistno", conlistno);
		map.put("begin", begin);
		map.put("end", end);
		try {
			listOption = sqlSession.selectList(namespace+"listOption",map);
		} catch (Exception e) {
			System.out.println("에렁");
			e.printStackTrace();
		}		
		return listOption;
	}
	
	@Override
	public int updateStar(int boardno, double star) {
		
		int res =0;
		ContestBoardDto dto = new ContestBoardDto(boardno,star);
		try {
			res = sqlSession.update(namespace+"updateStar",dto);
		} catch (Exception e) {
			System.out.println("에러다!");
			e.printStackTrace();
		}
		return res;
	}

	
	//여기까지 다시만듦
	@Override
	public List<ContestBoardDto> selectList(int begin, int end) {
		List<ContestBoardDto> list = new ArrayList<ContestBoardDto>();
		Map<String,Integer> map = new HashMap<String ,Integer>();
		map.put("begin", begin);
		map.put("end", end);
		try {
			list = sqlSession.selectList(namespace+"selectlist",map);
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
		try {
			res = sqlSession.delete(namespace+"boardDelete",groupno);
		} catch (Exception e) {
			System.out.println("에러남");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int boardDel(int boardno) {
		int res=0;
		res = sqlSession.delete(namespace+"deleteans",boardno);
		return res;
	}

	@Override
	public int boardDeleteReply(int boardno) {
		
		return 0;
	}

	@Override
	public int updateAns(int parentno) {
		int res=0;
		res = sqlSession.update(namespace+"updateAnd",parentno);
		return res;
	}

	@Override
	public int insertAns(ContestBoardDto dto) {
		
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
	public List<ContestBoardDto> selectListOption(int opt, String condition, int begin, int end) {
		// TODO Auto-generated method stub
		return null;
	}



}
