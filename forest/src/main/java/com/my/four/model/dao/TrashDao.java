package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.TrashDto;

public interface TrashDao {
	
	String namespace="trash.";
	
	public List<TrashDto> trashList();
	public int trashInsert(String imgRef,String trashName,String trashLife);

}
