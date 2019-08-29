package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.FreeboardDao;
import com.my.four.model.dto.FreeboardDto;
import com.my.four.model.dto.FreecommentDto;

@Service
public class FreeboardBizImpl implements FreeboardBiz {
	
	@Autowired
	private FreeboardDao dao;

	@Override
	public List<FreeboardDto> freeboardList(int firstIndex,int recordCountPerPage, String category, String txt_search) {
		return dao.freeboardList(firstIndex,recordCountPerPage, category, txt_search);
	}

	@Override
	public int freeboardGetTotalCount(String category, String txt_search) {
		return dao.freeboardGetTotalCount(category, txt_search);
	}
	
	@Override
	public FreeboardDto freedetail(int free_seq) {
		return dao.freedetail(free_seq);
	}

	@Override
	public int freeupdate(int free_seq, String title, String content) {
		return dao.freeupdate(free_seq, title, content);
	}

	@Override
	public int freedelete(int free_seq) {
		return dao.freedelete(free_seq);
	}

	@Override
	public int freeinsert(FreeboardDto dto) {
		return dao.freeinsert(dto);
	}

	@Override
	public List<FreecommentDto> freecommentList(int free_seq) {
		return dao.freecommentList(free_seq);
	}

	@Override
	public int commentinsert(int free_seq, String user_id, String content) {
		return dao.commentinsert(free_seq, user_id, content);
	}

	@Override
	public int commdelete(int comm_seq) {
		return dao.commdelete(comm_seq);
	}


}
