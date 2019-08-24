package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.AreaDto;
import com.my.four.model.dto.SortGameDto;
import com.my.four.model.dto.SortRankDto;

public interface PollutionDataDao {
	
	String namespace= "maparea.";
	
	public int inserttrash(List<AreaDto> list);

	public int insertwater(List<AreaDto> list);

	public int insertair(List<AreaDto> list);

	public boolean istrashin();
	
	public boolean iswaterin();
	
	public boolean isairin();
	
	public List<AreaDto> selectBigList(int bigOption,int miniOption);
	public List<AreaDto> selectMiniList(int bigOption,String areaname);
	
	//
	public int rankinsert(SortGameDto sortGameDto);
	public List<SortRankDto> ranklist();
}
