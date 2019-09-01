package com.my.four.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.my.four.model.dto.ContestBoardDto;
import com.my.four.model.dto.StarRecordDto;

public interface ContestBoardDao {
	
	@Autowired
	String namespace="contest.";

	public StarRecordDto amialready(int usernum,int boardno);
	public int boardInsert(ContestBoardDto dto);
	public int boardUpdate(ContestBoardDto dto);
	public int boardDelete(int groupno);
	public int boardDel(int boardno);
	public int boardDeleteReply(int boardno);
	public int getCount(int conlistno);
	public int getTotalCount();
	public int insertstarboard(StarRecordDto starDto);
	public int likeCntup(int boardno);
	public int replyCntup(int boardno);
	public ContestBoardDto selectOne(int boardno);
	public List<ContestBoardDto> selectThree(int conlistno);
	public List<ContestBoardDto> selectListReply(int groupno);
	public List<ContestBoardDto> selectList(int begin, int end);
	public List<ContestBoardDto> selectListOption(int conlistno, int begin, int end);
	public int updateStar(int boardno,double newstar);
	public int updateStarboard(StarRecordDto starDto);
	public int reupdateStar(int boardno,double newstar);
	public int insertAns(ContestBoardDto dto);
	public int updateAns(int parentno);
	public int ansdel(int boardno);
	public int replyCntDown(int pboardno);

	
}
