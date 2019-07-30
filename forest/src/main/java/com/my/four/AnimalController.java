package com.my.four;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.four.animal.AnimalShelterList;
import com.my.four.model.dao.AnimalShelterListDao;
import com.my.four.model.dto.AnimalShelterListDto;

@Controller
public class AnimalController {

	@Autowired
	AnimalShelterListDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "ani_shelterList.do")
	public String ani_shelterlist(Model model) {
		
//		AnimalShelterList list = new AnimalShelterList();
//		
//		list.returnJsonFile();
//		
//		logger.info("json파일 생성!");
		logger.info("보호소 목록으로!");
		
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
		
		int res = dao.insert(list);
		if (res > 0) {
			return "";
		}
		return null;
	}
	
	
}
