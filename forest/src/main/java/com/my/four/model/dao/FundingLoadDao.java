package com.my.four.model.dao;

import java.util.List;
import java.util.Map;

import com.my.four.model.dto.FundingLoadDto;

public interface FundingLoadDao {
	
	String namespace = "fundingload.";
	
	public List<FundingLoadDto> selectList();
	public int insert(FundingLoadDto dto);
	public Map<String, Object> select(String funtitle);
	public Map<String, Object> select1(String funtitle);
	public List<FundingLoadDto> paylist();
}
