package com.my.four.model.dao;

import java.util.List;

import com.my.four.model.dto.FreeboardDto;

public interface FreeboardDao {
	
	String namespace = "freeboard.";
	
	public List<FreeboardDto> freeboardList();
	public FreeboardDto freedetail(int free_seq);

}
