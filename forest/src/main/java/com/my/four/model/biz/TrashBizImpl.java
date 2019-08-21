package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.TrashDao;
import com.my.four.model.dto.TrashDto;

@Service
public class TrashBizImpl implements TrashBiz{
	
	@Autowired
	private TrashDao dao;
	
	@Override
	public List<TrashDto> trashList() {
		// TODO Auto-generated method stub
		return dao.trashList();
	}


	@Override
	public int trashCount() {
		// TODO Auto-generated method stub
		return dao.trashCount();
	}

	@Override
	public int trashInsert( List<TrashDto> trashCrawling) {
		// TODO Auto-generated method stub
		return dao.trashInsert(trashCrawling);
	}


	
}
