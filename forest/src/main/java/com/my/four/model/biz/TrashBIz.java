package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.TrashDto;

public interface TrashBIz {

	public List<TrashDto> trashList();
	public int trashInsert(String imgRef,String trashName,String trashLife);
}
