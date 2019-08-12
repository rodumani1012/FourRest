package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.AnimalEndangeredCSVDto;
import com.my.four.model.dto.AnimalEndangeredImgDto;
import com.my.four.model.dto.AnimalEndangeredJoinDto;
import com.my.four.model.dto.AnimalShelterListDto;

public interface AnimalListDao {

	String namespace = "animal.";
	
	public int aniInsert(List<AnimalShelterListDto> dtos);
	public List<AnimalShelterListDto> aniSelectList(int firstIndex, int recordCountPerPage,String txt_search);
	public int aniGetTotalCount(String txt_search);
	
	public int aniInsertEndangeredCSV(List<AnimalEndangeredCSVDto> dtos);
	public int aniGetTotalCountEndangeredCSV(String txt_search);

	public int aniInsertEndangeredImg(List<AnimalEndangeredImgDto> dtos);

	public List<AnimalEndangeredJoinDto> aniSelectListEndangeredJoin();
	public List<AnimalEndangeredJoinDto> aniSelectListEndangeredJoin(int firstIndex, int recordCountPerPage, String txt_search);
	public int aniInsertEndangeredJoin(List<AnimalEndangeredJoinDto> dtos);
	public int aniGetTotalCountEndangeredJoin(String txt_search);
	
	public int aniGetOne(String grade, String groups);
	
	public int aniGetTotalCountDisturbHarm(String category, String txt_search);
	
}
