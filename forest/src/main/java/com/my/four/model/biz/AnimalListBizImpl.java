package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.AnimalListDao;
import com.my.four.model.dto.AnimalEndangeredCSVDto;
import com.my.four.model.dto.AnimalEndangeredImgDto;
import com.my.four.model.dto.AnimalEndangeredJoinDto;
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
	public int aniInsertEndangeredCSV(List<AnimalEndangeredCSVDto> dtos) {
		return dao.aniInsertEndangeredCSV(dtos);
	}

	@Override
	public List<AnimalEndangeredCSVDto> aniSelectListEndangeredCSV(int firstIndex, int recordCountPerPage,
			String txt_search) {
		return dao.aniSelectListEndangeredCSV(firstIndex, recordCountPerPage, txt_search);
	}

	@Override
	public int aniGetTotalCountEndangeredCSV(String txt_search) {
		return dao.aniGetTotalCountEndangeredCSV(txt_search);
	}

	@Override
	public int aniInsertEndangeredImg(List<AnimalEndangeredImgDto> dtos) {
		return dao.aniInsertEndangeredImg(dtos);
	}

	@Override
	public List<AnimalEndangeredJoinDto> aniSelectListEndangeredJoin(int firstIndex, int recordCountPerPage,
			String txt_search) {
		return dao.aniSelectListEndangeredJoin(firstIndex, recordCountPerPage, txt_search);
	}

}
