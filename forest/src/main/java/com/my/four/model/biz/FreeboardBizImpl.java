package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.FreeboardDao;
import com.my.four.model.dto.FreeboardDto;

@Service
public class FreeboardBizImpl implements FreeboardBiz {
	
	@Autowired
	private FreeboardDao dao;

	@Override
	public List<FreeboardDto> freeboardList() {
		return dao.freeboardList();
	}

	@Override
	public FreeboardDto freedetail(int free_seq) {
		return dao.freedetail(free_seq);
	}

}
