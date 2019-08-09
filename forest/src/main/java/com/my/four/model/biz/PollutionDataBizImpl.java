package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.PollutionDataDao;
import com.my.four.model.dto.AreaDto;
@Service
public class PollutionDataBizImpl implements PollutionDataBiz {
	
	@Autowired
	PollutionDataDao dao;
	
	@Override
	public int inserttrash(List<AreaDto> list) {
		if(dao.istrashin())
			return 1;
		return dao.inserttrash(list);
	}

	@Override
	public int insertwater(List<AreaDto> list) {
		if(dao.iswaterin())
			return 1;
		return dao.insertwater(list);
	}

	@Override
	public int insertair(List<AreaDto> list) {
		if(dao.isairin())
			return 1;
		return dao.insertair(list);
	}
	
	

}
