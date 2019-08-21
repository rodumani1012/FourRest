package com.my.four.model.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import com.my.four.model.dto.FreeboardDto;

public interface FreeboardBiz {
	
	public List<FreeboardDto> freeboardList();
	public FreeboardDto freedetail(int free_seq);

}
