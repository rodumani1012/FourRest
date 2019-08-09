package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.AreaDto;

public interface PollutionDataBiz {
	
	public int inserttrash(List<AreaDto> list);
	public int insertwater(List<AreaDto> list);
	public int insertair(List<AreaDto> list);
}
