package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.PollutionDataDao;
import com.my.four.model.dto.AreaDto;
import com.my.four.model.dto.SortGameDto;
import com.my.four.model.dto.SortRankDto;
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

	@Override
	public List<AreaDto> selectBigList(int bigOption, int miniOption) {
		// TODO Auto-generated method stub
		return dao.selectBigList(bigOption, miniOption);
	}

	@Override
	public List<AreaDto> selectMiniList(int bigOption, String areaname) {
		// TODO Auto-generated method stub
		return dao.selectMiniList(bigOption, areaname);
	}

	@Override
	public int rankinsert(SortGameDto sortGameDto) {
		// TODO Auto-generated method stub
		return dao.rankinsert(sortGameDto);
	}

	@Override
	public List<SortRankDto> ranklist() {
		// TODO Auto-generated method stub
		return dao.ranklist();
	}

	@Override
	public List<SortRankDto> ranklistProc(SortGameDto sortGameDto) {
		int result =0;
		result = dao.rankinsert(sortGameDto);
		if(result<1) {
			System.out.println("insert no");
			return null;
		}
		List<SortRankDto> list = null;
		list = dao.ranklist();
		
		return list;
	}
	
	

}
