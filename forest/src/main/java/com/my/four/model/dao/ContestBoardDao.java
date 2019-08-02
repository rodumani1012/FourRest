package com.my.four.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.my.four.model.dto.ContestBoardDto;

public interface ContestBoardDao {
	
	@Autowired
	String namespace="contest.";
	public List<ContestBoardDto> selectList(int begin,int end);
	public ContestBoardDto selectOne(int boardno);
	public int boardInsert(ContestBoardDto dto);
	public int boardUpdate(ContestBoardDto dto);
	public int boardDelete(int groupno);
	public int boardDel(int boardno);
	public int boardDeleteReply(int boardno);
	public int updateAns(int parentno);
	public int insertAns(ContestBoardDto dto);
	public int getTotalCount();
	public List<ContestBoardDto> selectListOption(int opt, String condition, int begin, int end);
	public List<ContestBoardDto> selectListReply(int groupno);
	public int replyCntup(int boardno);
	public int likeCntup(int boardno);
	public int answProc(ContestBoardDto dto);
	public List<ContestBoardDto> selectThree();
}
