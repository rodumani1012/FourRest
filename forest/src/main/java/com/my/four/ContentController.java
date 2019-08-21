package com.my.four;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentController {
 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="content.do")
	public String content() {
		logger.info("game");
		
		return "content";
	}
	
	@RequestMapping(value="quiz.do")
	public String quiz() {
		logger.info("퀴즈 게임하기");
		
		return "content/quiz";
	}

	@RequestMapping(value="puzzle.do")
	public String puzzle() {
		logger.info("후원하기");
		
		return "content/puzzle";
	}
	
	@RequestMapping(value="crossword.do")
	public String crossword() {
		logger.info("후원하기");
		
		return "content/crossword";
	}
	
	@RequestMapping(value="puzzleselect.do")
	public String puzzleselect() {
		logger.info("난이도 정하기");
		
		return "content/puzzleselect";
	}
	
	@RequestMapping(value="puzzlehigh.do")
	public String puzzlehigh() {
		logger.info("상");
		
		return "content/puzzlehigh";
	}
	
	@RequestMapping(value="puzzlemiddle.do")
	public String puzzlemiddle() {
		logger.info("중");
		
		return "content/puzzlemiddle";
	}
	
	@RequestMapping(value="puzzlerow.do")
	public String puzzlerow() {
		logger.info("하");
		
		return "content/puzzlerow";
	}
	
}
