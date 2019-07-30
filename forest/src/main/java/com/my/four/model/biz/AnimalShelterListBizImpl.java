package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.AnimalShelterListDao;
import com.my.four.model.dto.AnimalShelterListDto;

@Service
public class AnimalShelterListBizImpl implements AnimalShelterListBiz {

	@Autowired
	AnimalShelterListDao dao;
	
	@Override
	public int insert(List<AnimalShelterListDto> dtos) {
		return dao.insert(dtos);
	}

}
