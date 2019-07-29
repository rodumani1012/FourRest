package com.my.four;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/main")
	public String main() {
	
		logger.info("메인!!");
		
		return "main";
	}
	
	@RequestMapping(value="/sponsor")
	public String sponsor() {
		logger.info("후원하기");
		
		
		return "sponsor";
	}
	
	@RequestMapping(value="/loginform.do")
	public String loginform() {
		logger.info("로그인");
		
		return "login";
	}
	
	@RequestMapping(value="/joinform.do")
	
	public String joinform(){
		logger.info("회원가입");
		
		return "join";
	}
	
	@RequestMapping(value="map")
		public String map(){	
		logger.info("지도나와아");
		
		return "map";
		
	}
	
}
