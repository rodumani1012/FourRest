package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.ContestListDto;

public interface ContestListBiz {
	
	public List<ContestListDto> selectList();
	public ContestListDto selectOne(int conlistno);
	
	public int insert(ContestListDto dto);
	public int delete(int conlistno);
	public int updatepart(int conlistno);
	public int concount();
}
