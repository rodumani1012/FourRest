package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.AnimalListDao;
import com.my.four.model.dto.AnimalEndangeredSpeciesDto;
import com.my.four.model.dto.AnimalShelterListDto;

@Service
public class AnimalListBizImpl implements AnimalListBiz {

	@Autowired
	AnimalListDao dao;
	
	@Override
	public int aniInsert(List<AnimalShelterListDto> dtos) {
		return dao.aniInsert(dtos);
	}

	@Override
	public List<AnimalShelterListDto> aniSelectList(int firstIndex, int recordCountPerPage,
			String txt_search) {
		return dao.aniSelectList(firstIndex, recordCountPerPage, txt_search);
	}

	@Override
	public int aniGetTotalCount(String txt_search) {
		return dao.aniGetTotalCount(txt_search);
	}

	@Override
	public int aniInsertEndangered(List<AnimalEndangeredSpeciesDto> dtos) {
		return dao.aniInsertEndangered(dtos);
	}

	@Override
	public List<AnimalEndangeredSpeciesDto> aniSelectListEndangered(int firstIndex, int recordCountPerPage,
			String txt_search) {
		return dao.aniSelectListEndangered(firstIndex, recordCountPerPage, txt_search);
	}

	@Override
	public int aniGetTotalCountEndangered(String txt_search) {
		return dao.aniGetTotalCountEndangered(txt_search);
	}

}
