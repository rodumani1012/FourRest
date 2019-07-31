package com.my.four;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.model.dao.AnimalShelterListDao;
import com.my.four.model.dto.AnimalShelterListDto;
import com.my.four.model.dto.AnimalShelterListPagingDto;

@Controller
public class AnimalController {

	@Autowired
	AnimalShelterListDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "ani_shelterList.do")
	public String ani_shelterlist(String pageNum, String contentNum, Model model) {
		logger.info("보호소 목록으로!");
		
		int pageNumber = Integer.parseInt(pageNum); // 현재 페이지
		int contentNumber = Integer.parseInt(contentNum); // 페이지당 보여줄 게시물 수
		
		int totalCount = dao.aniGetTotalCount(); // 총 게시물 갯수 가져오기
		
		AnimalShelterListPagingDto dto = new AnimalShelterListPagingDto(totalCount, pageNumber, contentNumber);
		
		List<AnimalShelterListDto> list = dao.aniSelectList(dto.getStartCon(), dto.getEndCon());
		
		model.addAttribute("list", list);
		model.addAttribute("pag", dto);
		
		return "shelterList/animalshelterlist";
	}

	@RequestMapping(value = "ani_saveDb.do")
	public String ani_saveDb(String[] shelterInfo, Model model) {
		
		String[] shelterList = shelterInfo;
		List<AnimalShelterListDto> list = new ArrayList<AnimalShelterListDto>();
		
		for (int i = 0; i < shelterList.length; i++) {
			AnimalShelterListDto dto = new AnimalShelterListDto();
			String[] shelter = shelterList[i].split("/");
			dto.setArea(shelter[0]);
			dto.setCenterName(shelter[1]);
			dto.setPhoneNumber(shelter[2]);
			dto.setCenterAddr(shelter[3]);
			
			list.add(dto);
		}

		int res = dao.aniInsert(list);
		System.out.println("컨트롤러 갯수 : " + res);
		if (res > 0) {
			return "main";
		}
		return "main";
	}
	
	
}
