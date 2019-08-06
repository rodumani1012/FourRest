package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.AnimalEndangeredSpeciesDto;
import com.my.four.model.dto.AnimalShelterListDto;

public interface AnimalListBiz {

	public int aniInsert(List<AnimalShelterListDto> dtos);
	public List<AnimalShelterListDto> aniSelectList(int firstIndex, int recordCountPerPage,String txt_search);
	public int aniGetTotalCount(String txt_search);
	
	public int aniInsertEndangered(List<AnimalEndangeredSpeciesDto> dtos);
	public List<AnimalEndangeredSpeciesDto> aniSelectListEndangered(int firstIndex, int recordCountPerPage,String txt_search);
	public int aniGetTotalCountEndangered(String txt_search);
}
