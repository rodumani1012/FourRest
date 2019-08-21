package com.my.four;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.model.biz.FreeboardBiz;

@Controller
public class FreeboardController {
	
	@Autowired
	private FreeboardBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="freeboardlist.do")
	public String freeboardlist(Model model) {
		
		logger.info("자유게시판 리스트");
		model.addAttribute("list", biz.freeboardList());
		return "freeboard/freeboardlist";
	}
	
	@RequestMapping(value="freedetail.do")
	public String freedetail(Model model, int free_seq) {
		
		logger.info("자유게시판 리스트");
		model.addAttribute("list", biz.freedetail(free_seq));
		return "freeboard/freedetail";
	}

	
}
