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
import com.my.four.paging.Paging;

@Controller
public class AnimalController {

	@Autowired
	AnimalShelterListDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "ani_shelterList.do")
	public String ani_shelterlist(String txt_search, String page, Model model) {
		logger.info("보호소 목록으로!");
		
		String txt_s = txt_search;

		int totalCount = dao.aniGetTotalCount(txt_s);
		int pag = (page == null) ? 1 : Integer.parseInt(page);

		Paging paging = new Paging();

		paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalCount);
		pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.

		List<AnimalShelterListDto> list = dao.aniSelectList(pag, paging.getPageSize(), txt_s);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("txt_search", txt_s);
		
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
