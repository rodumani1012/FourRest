package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.FundingDto;

public interface FundingDao {

	String namespace = "funding.";
	
	public List<FundingDto> selectList();
	public FundingDto selectOne(String funtitle);
	public int insert(FundingDto dto);
	public int update(FundingDto dto);
	public int delete(String id);
	public int muldel(String[] chk);
}
