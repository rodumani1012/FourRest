package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.my.four.model.dao.TrashDao;
import com.my.four.model.dto.TrashDto;

public class TrashBizImpl implements TrashBIz{
	
	@Autowired
	private TrashDao dao;
	
	@Override
	public List<TrashDto> trashList() {
		// TODO Auto-generated method stub
		return dao.trashList();
	}

	@Override
	public int trashInsert(String imgRef, String trashName, String trashLife) {
		// TODO Auto-generated method stub
		return dao.trashInsert(imgRef, trashName, trashLife);
	}
	
}
