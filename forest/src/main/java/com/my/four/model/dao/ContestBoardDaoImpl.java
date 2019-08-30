package com.my.four.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.four.model.dto.ContestBoardDto;
import com.my.four.model.dto.StarRecordDto;

@Repository
public class ContestBoardDaoImpl implements ContestBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public StarRecordDto amialready(int usernum, int boardno) {
		StarRecordDto starDto = null;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("usernum", usernum);
		map.put("boardno", boardno);
		starDto = sqlSession.selectOne(namespace + "amialready", map);
		if (starDto != null)
			return starDto;
		else {
			return null;			
		}
	}

	@Override
	public int boardInsert(ContestBoardDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "boardInsert", dto);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int boardUpdate(ContestBoardDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "boardUpdate", dto);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int boardDelete(int groupno) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace + "boardDelete", groupno);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int boardDel(int boardno) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace + "deleteans", boardno);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int boardDeleteReply(int boardno) {

		return 0;
	}

	@Override
	public int getCount(int conlistno) {
		int res = 0;
		ContestBoardDto dto = new ContestBoardDto(conlistno);
		try {
			res = sqlSession.selectOne(namespace + "getCount", dto);
		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int getTotalCount() {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne(namespace + "selectTotalCount");
		} catch (Exception e) {
			System.out.println("totalcountError");
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertstarboard(StarRecordDto starDto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "starboardinsert", starDto);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int likeCntup(int boardno) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "likeCntup", boardno);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int replyCntup(int boardno) {
		int res =0;
		try {
			res = sqlSession.update(namespace+"replyCntup",boardno);
		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public ContestBoardDto selectOne(int boardno) {
		ContestBoardDto dto = null;
		try {
			dto = sqlSession.selectOne(namespace + "selectOne", boardno);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<ContestBoardDto> selectThree(int conlistno) {
		List<ContestBoardDto> threelist = null;
		ContestBoardDto dto = new ContestBoardDto(conlistno);
		try {
			threelist = sqlSession.selectList(namespace + "selectThree", dto);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return threelist;
	}

	@Override
	public List<ContestBoardDto> selectListReply(int groupno) {
		List<ContestBoardDto> list = new ArrayList<ContestBoardDto>();
		try {
			list = sqlSession.selectList(namespace + "selectListReply", groupno);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}

		return list;
	}

	// 여기까지 다시만듦
	@Override
	public List<ContestBoardDto> selectList(int begin, int end) {
		List<ContestBoardDto> list = new ArrayList<ContestBoardDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		try {
			list = sqlSession.selectList(namespace + "selectlist", map);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ContestBoardDto> selectListOption(int conlistno, int begin, int end) {
		List<ContestBoardDto> listOption = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("conlistno", conlistno);
		map.put("begin", begin);
		map.put("end", end);
		try {
			listOption = sqlSession.selectList(namespace + "listOption", map);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return listOption;
	}

	@Override
	public int updateStar(int boardno, double star) {

		int res = 0;
		ContestBoardDto dto = new ContestBoardDto(boardno, star);
		try {
			res = sqlSession.update(namespace + "updateStar", dto);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int reupdateStar(int boardno, double newstar) {
		int res = 0;
		ContestBoardDto dto = new ContestBoardDto(boardno, newstar);
		try {
			res = sqlSession.update(namespace + "reupdateStar", dto);
		} catch (Exception e) {
			System.out.println("에러 ");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateStarboard(StarRecordDto starDto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "starboardupdate", starDto);
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateAns(int parentno) {
		int res =0;
		try {
			res = sqlSession.update(namespace+"updateAns",parentno);
		} catch (Exception e) {
			System.out.println("updateAns에러");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int insertAns(ContestBoardDto dto) {
		int res =0;
		try {
			res = sqlSession.insert(namespace+"insertAns",dto);
		} catch (Exception e) {
			System.out.println("insertAns에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int ansdel(int boardno) {
		int res =0;
		try {
			res = sqlSession.delete(namespace+"ansdel",boardno);
		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int replyCntDown(int pboardno) {
		int res =0;
		try {
			res = sqlSession.update(namespace+"replycntdown",pboardno);
		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		return res;
	}


}
