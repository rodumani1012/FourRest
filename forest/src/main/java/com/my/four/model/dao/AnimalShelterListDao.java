package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.AnimalShelterListDto;

public interface AnimalShelterListDao {

	String namespace = "animal.";
	
	public int aniInsert(List<AnimalShelterListDto> dtos);
	public List<AnimalShelterListDto> aniSelectList(int begin, int end);
	public int aniGetTotalCount();
}
