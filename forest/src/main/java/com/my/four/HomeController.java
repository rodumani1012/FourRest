package com.my.four;



import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.four.model.biz.LoginBiz;
import com.my.four.model.biz.MailService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MailService mailSerivce;
	
	@Autowired
	private LoginBiz biz;
	
	@RequestMapping(value="main.do")
	public String main() {
	
		logger.info("메인!!");
		
		return "main";
	}
	
	@RequestMapping(value="sponsor.do")
	public String sponsor() {
		logger.info("후원하기");
		
		
		return "sponsor";
	}
	
	@RequestMapping(value="loginform.do")
	public String loginform() {
		logger.info("로그인");
		
		return "member/login";
	}
	
	@RequestMapping(value="joinform.do")
	
	public String joinform(){
		logger.info("회원가입");
		
		return "member/join";
	}
	
	@RequestMapping(value="map.do")
		public String map(){	
		logger.info("지도나와아");
		
		return "map";
	}
	
	@RequestMapping(value="idChk.do")
	public String idChk(String id,Model model) {
		logger.info("id=="+id);
		model.addAttribute("idchk",biz.idChk(id));
		return "idchk";
	}
	@RequestMapping(value="addpop.do")
	public String addPop() {
		return "addpop";
	}
	@RequestMapping(value="mailSend.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> sendMail(HttpSession session, String emailName,String emailForm) {
		int ran = new Random().nextInt(100000)+10000;//10000~99999 
		String email = emailName +"@"+emailForm;
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		
		String subject ="회원 가입 인증 코드 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증코드는"+joinCode+"입니다.");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", mailSerivce.send(subject,sb.toString(),"wjy1408@gmail.com",email,null));
		return map;
	}
	
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
	
}
