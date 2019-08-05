package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.ContestBoardDto;

public interface ContestBoardBiz {
	
	public List<ContestBoardDto> selectListOption(int conlistno, int begin, int end);
	public int getCount(int conlistno);
	public int updateStar(int boardno,int star);
	
	public List<ContestBoardDto> selectList(int begin, int end);
	public ContestBoardDto selectOne(int boardno);
	public int boardInsert(ContestBoardDto dto);
	public int boardUpdate(ContestBoardDto dto);
	public int boardDelete(int groupno);
	public int boardDel(int boardno);
	public int boardDeleteReply(int boardno);
	public int insertAns(ContestBoardDto dto);
	public List<ContestBoardDto> selectListReply(int groupno);
	public int replyCntup(int boardno);
	public int likeCntup(int boardno);
	public int answProc(ContestBoardDto dto);
	public List<ContestBoardDto> selectThree(int conlistno);
	public int getTotalCount();
	
	

}
