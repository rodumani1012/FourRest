package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.TrashDto;

public interface TrashBiz {

	public List<TrashDto> trashList();
	public int trashInsert(List<TrashDto> trashCrawling);
	public int trashCount();
}
