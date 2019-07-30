package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.AnimalShelterListDto;

public interface AnimalShelterListDao {

	public int insert(List<AnimalShelterListDto> dtos);
}
