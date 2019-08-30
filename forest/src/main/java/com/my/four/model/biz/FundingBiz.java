package com.my.four.model.biz;

import java.util.List;

import com.my.four.model.dto.FundingDto;
import com.my.four.model.dto.FundingLoadDto;

public interface FundingBiz {
	
	public List<FundingDto> selectList();
	public FundingDto selectOne(String funtitle);
	public int insert(FundingDto dto);
	public int update(String funtitle, String id);
	public int delete(String id);
	public int muldel(FundingDto dto, String id);
	public int funupdate(String funtitle, int funmoney);
	public int funupdate1(String funtitle, int count);

}
