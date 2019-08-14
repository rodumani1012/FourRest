package com.my.four.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.four.model.dao.AnimalListDao;
import com.my.four.model.dto.AnimalDisturbDto;
import com.my.four.model.dto.AnimalEndangeredCSVDto;
import com.my.four.model.dto.AnimalEndangeredImgDto;
import com.my.four.model.dto.AnimalEndangeredJoinDto;
import com.my.four.model.dto.AnimalHarmDto;
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
	public int aniGetTotalCountEndangeredCSV(String txt_search) {
		return dao.aniGetTotalCountEndangeredCSV(txt_search);
	}

	@Override
	public int aniInsertEndangeredImg(List<AnimalEndangeredImgDto> dtos) {
		return dao.aniInsertEndangeredImg(dtos);
	}

	@Override
	public List<AnimalEndangeredJoinDto> aniSelectListEndangeredJoin() {
		return dao.aniSelectListEndangeredJoin();
	}
	
	@Override
	public List<AnimalEndangeredJoinDto> aniSelectListEndangeredJoin(int firstIndex, int recordCountPerPage,
			String txt_search) {
		return dao.aniSelectListEndangeredJoin(firstIndex, recordCountPerPage, txt_search);
	}

	@Override
	public int aniInsertEndangeredJoin(List<AnimalEndangeredJoinDto> dtos) {
		return dao.aniInsertEndangeredJoin(dtos);
	}
	
	@Override
	public int aniGetTotalCountEndangeredJoin(String txt_search) {
		return dao.aniGetTotalCountEndangeredJoin(txt_search);
	}

	@Override
	public int aniGetOne(String grade, String groups) {
		return dao.aniGetOne(grade, groups);
	}

	@Override
	public int aniGetTotalCountDisturbHarm(String board, String txt_search) {
		return dao.aniGetTotalCountDisturbHarm(board, txt_search);
	}
	
	@Override
	public int aniGetTotalCountDisturbHarm(String groups, String board, String txt_search) {
		if(groups == null) { 
			groups = "all"; 
		}
		
		switch (groups) {
		case "mammal":
			groups = "포유류";
			break;
		case "birds":
			groups = "조류";
			break;
		case "reptile":
			groups = "파충류";
			break;
		case "amphibian":
			groups = "양서류";
			break;
		case "fish":
			groups = "어류";
			break;
		case "insect":
			groups = "곤충";
			break;
		case "invertebrate":
			groups = "무척추동물";
			break;
		case "plants":
			groups = "식물";
			break;
		default :
			groups = "all";
			break;
		}
		System.out.println("그룹은 : " + groups);
		return dao.aniGetTotalCountDisturbHarm(groups, board, txt_search);
	}

	@Override
	public int aniInsertDisturbHarm(String board, Object dtos) {
		return dao.aniInsertDisturbHarm(board, dtos);
	}

	@Override
	public List<AnimalDisturbDto> aniSelectListDisturb(int firstIndex, int recordCountPerPage, String txt_search) {
		return dao.aniSelectListDisturb(firstIndex, recordCountPerPage, txt_search);
	}

	@Override
	public List<AnimalHarmDto> aniSelectListHarm(int firstIndex, int recordCountPerPage, String txt_search) {
		return dao.aniSelectListHarm(firstIndex, recordCountPerPage, txt_search);
	}

}
