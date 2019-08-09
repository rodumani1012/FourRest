package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.AreaDto;

public interface PollutionDataDao {
	
	String namespace= "maparea.";
	
	public int inserttrash(List<AreaDto> list);

	public int insertwater(List<AreaDto> list);

	public int insertair(List<AreaDto> list);

	public boolean istrashin();
	
	public boolean iswaterin();
	
	public boolean isairin();
	

}
