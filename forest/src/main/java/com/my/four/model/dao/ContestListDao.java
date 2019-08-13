package com.my.four.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.my.four.model.dto.ContestListDto;

public interface ContestListDao {
	@Autowired
	String namespace = "contestlist.";
	public List<ContestListDto> selectList();
	public ContestListDto selectOne(int conlistno);
	
	
	
	public int insert(ContestListDto dto);
	public int delete(int conlistno);
	public int updatepart(int conlistno);
}
