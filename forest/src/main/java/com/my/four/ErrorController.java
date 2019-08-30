package com.my.four;

import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "error.do")
	public String error(String kind, Model model) {
		logger.info("에러 발생. 에러페이지로 이동!");
		logger.info("종류 : " + kind);
		
		model.addAttribute("kind", kind);
		return "error";
	}
}
