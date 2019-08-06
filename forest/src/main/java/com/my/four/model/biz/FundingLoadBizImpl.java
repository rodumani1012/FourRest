package com.my.four.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.FundingLoadDao;
import com.my.four.model.dto.FundingLoadDto;

@Service
public class FundingLoadBizImpl implements FundingLoadBiz {

	@Autowired
	private FundingLoadDao dao;

	@Override
	public List<FundingLoadDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public int insert(FundingLoadDto dto) {
		return dao.insert(dto);
	}

	@Override
	public Map<String, Object> select(String funtitle) {
		return dao.select(funtitle);
	}

	@Override
	public Map<String, Object> select1(String funtitle) {
		return dao.select1(funtitle);
	}


}
