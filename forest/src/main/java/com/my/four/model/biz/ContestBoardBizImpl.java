package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.ContestBoardDao;
import com.my.four.model.dto.ContestBoardDto;

@Service
public class ContestBoardBizImpl implements ContestBoardBiz {

	@Autowired
	private ContestBoardDao dao;
	
	@Override
	public ContestBoardDto selectOne(int boardno) {
		// TODO Auto-generated method stub
		return dao.selectOne(boardno);
	}

	@Override
	public int boardInsert(ContestBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.boardInsert(dto);
	}

	@Override
	public int boardUpdate(ContestBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.boardUpdate(dto);
	}

	@Override
	public int boardDelete(int groupno) {
		// TODO Auto-generated method stub
		return dao.boardDelete(groupno);
	}

	@Override
	public int boardDel(int boardno) {
		// TODO Auto-generated method stub
		return dao.boardDel(boardno);
	}

	@Override
	public int boardDeleteReply(int boardno) {
		// TODO Auto-generated method stub
		return dao.boardDeleteReply(boardno);
	}

	@Override
	public int updateAns(int parentno) {
		// TODO Auto-generated method stub
		return dao.updateAns(parentno);
	}

	@Override
	public int insertAns(ContestBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.insertAns(dto);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return dao.getTotalCount();
	}

	@Override
	public List<ContestBoardDto> selectListOption(int opt, String condition, int begin, int end) {
		// TODO Auto-generated method stub
		return dao.selectListOption(opt, condition, begin, end);
	}

	@Override
	public List<ContestBoardDto> selectListReply(int groupno) {
		// TODO Auto-generated method stub
		return dao.selectListReply(groupno);
	}

	@Override
	public int replyCntup(int boardno) {
		// TODO Auto-generated method stub
		return dao.replyCntup(boardno);
	}

	@Override
	public int likeCntup(int boardno) {
		// TODO Auto-generated method stub
		return dao.likeCntup(boardno);
	}

	@Override
	public int answProc(ContestBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.answProc(dto);
	}

	@Override
	public List<ContestBoardDto> selectThree() {
		// TODO Auto-generated method stub
		return dao.selectThree();
	}

	@Override
	public List<ContestBoardDto> selectList(int begin, int end) {
		System.out.println("비즈임");
		return dao.selectList(begin, end);
	}

}
