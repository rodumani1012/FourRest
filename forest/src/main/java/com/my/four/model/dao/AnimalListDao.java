package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.AnimalShelterListDto;

public interface AnimalListDao {

	String namespace = "animal.";
	
	public int aniInsert(List<AnimalShelterListDto> dtos);
	public List<AnimalShelterListDto> aniSelectList(int firstIndex, int recordCountPerPage,String txt_search);
	public int aniGetTotalCount(String txt_search);
}
