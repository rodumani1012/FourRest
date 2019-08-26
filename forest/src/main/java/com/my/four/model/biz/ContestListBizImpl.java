package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.ContestListDao;
import com.my.four.model.dto.ContestListDto;

@Service
public class ContestListBizImpl implements ContestListBiz {

	@Autowired
	private ContestListDao dao;
	
	@Override
	public List<ContestListDto> selectList() {
		return dao.selectList();
	}

	@Override
	public int insert(ContestListDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int conlistno) {
		return dao.delete(conlistno);
	}

	@Override
	public ContestListDto selectOne(int conlistno) {
		return dao.selectOne(conlistno);
	}

	@Override
	public int updatepart(int conlistno) {
		return dao.updatepart(conlistno);
	}

	@Override
	public int concount() {
		// TODO Auto-generated method stub
		return dao.concount();
	}
	
	

}
