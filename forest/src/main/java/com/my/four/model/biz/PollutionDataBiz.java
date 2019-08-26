package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.AreaDto;
import com.my.four.model.dto.SortGameDto;
import com.my.four.model.dto.SortRankDto;

public interface PollutionDataBiz {
	
	public int inserttrash(List<AreaDto> list);
	public int insertwater(List<AreaDto> list);
	public int insertair(List<AreaDto> list);
	
	public List<AreaDto> selectBigList(int bigOption,int miniOption);
	public List<AreaDto> selectMiniList(int bigOption,String areaname);
	
//	분리수거
	public int rankinsert(SortGameDto sortGameDto);
	public List<SortRankDto> ranklist();

	public List<SortRankDto> ranklistProc(SortGameDto sortGameDto);
}
