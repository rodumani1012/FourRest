package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.AnimalShelterListDto;

public interface AnimalShelterListDao {

	String namespace = "animal.";
	
	public int insert(List<AnimalShelterListDto> dtos);
}
