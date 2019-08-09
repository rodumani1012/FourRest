package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.FundingDao;
import com.my.four.model.dto.FundingDto;
import com.my.four.model.dto.FundingLoadDto;

@Service
public class FundingBizImpl implements FundingBiz {
	
	@Autowired
	private FundingDao dao;

	@Override
	public List<FundingDto> selectList() {
		return dao.selectList();
	}

	@Override
	public FundingDto selectOne(String funtitle) {
		return dao.selectOne(funtitle);
	}

	@Override
	public int insert(FundingDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(String funtitle, String id) {
		return dao.update(funtitle, id);
	}

	@Override
	public int delete(String id) {
		return dao.delete(id);
	}

	@Override
	public int muldel(FundingDto dto, String id) {
		return dao.muldel(dto, id);
	}

	@Override
	public int funupdate(String funtitle, int funmoney) {
		return dao.funupdate(funtitle, funmoney);
	}

	@Override
	public int funupdate1(String funtitle, int count) {
		return dao.funupdate1(funtitle, count);
	}
	
	

}
