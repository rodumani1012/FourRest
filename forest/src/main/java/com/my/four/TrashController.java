package com.my.four;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.crawling.TrashList;
import com.my.four.model.biz.TrashBiz;
import com.my.four.model.dto.TrashDto;

@Controller
public class TrashController {
	
	@Autowired
	private TrashBiz biz;
	
	@Autowired
	private TrashList trash;
	
	@RequestMapping("/trash.do")
	public String trashList(Model model) {
		int trashCount = biz.trashCount();
		if(trashCount ==0) {
			biz.trashInsert(trash.trashCrawling());
			List<TrashDto> list =biz.trashList();
			model.addAttribute("list", list);
			return "trash/trash";
		}else {
			List<TrashDto> list = biz.trashList();
			model.addAttribute("list", list);
			return "trash/trash";
		}
	}
}
