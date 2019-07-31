package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.AnimalShelterListDto;

public interface AnimalShelterListBiz {

	public int aniInsert(List<AnimalShelterListDto> dtos);
	public List<AnimalShelterListDto> aniSelectList(int begin, int end);
	public int aniGetTotalCount();
}
