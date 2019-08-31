package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.ContestBoardDto;
import com.my.four.model.dto.StarRecordDto;

public interface ContestBoardBiz {
	
	public StarRecordDto amialready(int usernum,int boardno);
	public int boardInsert(ContestBoardDto dto);
	public int boardUpdate(ContestBoardDto dto);
	public int boardDelete(int groupno);
	public int boardDel(int boardno);
	public int boardDeleteReply(int boardno);
	public int getCount(int conlistno);
	public int getTotalCount();
	public int insertstarboard(StarRecordDto starDto);
	public int insertAns(ContestBoardDto dto);
	public int likeCntup(int boardno);
	public int replyCntup(int boardno);
	public ContestBoardDto selectOne(int boardno);
	public List<ContestBoardDto> selectThree(int conlistno);
	public List<ContestBoardDto> selectListReply(int groupno);
	public List<ContestBoardDto> selectList(int begin, int end);
	public List<ContestBoardDto> selectListOption(int conlistno, int begin, int end);
	public int updateStar(int boardno,int star);
	public int starProc(int usernum,int boardno,int newstar); //스타보드(처음이면입력/수정) & 콘보드(스타업데이트,처음인경우카운트올리기)
	public int reupdateStar(int boardno, int newstar, int gustar);
	public int ansProc(ContestBoardDto dto);
	public int ansdel(int boardno);
	public int replyCntDown(int pboardno);

}