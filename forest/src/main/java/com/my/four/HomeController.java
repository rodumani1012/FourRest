package com.my.four;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.four.model.biz.LoginBiz;
import com.my.four.model.biz.MailService;
import com.my.four.model.dto.LoginDto;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MailService mailSerivce;
	//암호화 해주는 메소드
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
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
		
		return "login";
	}
	
	@RequestMapping(value="joinform.do")
	
	public String joinform(){
		logger.info("회원가입");
		
		return "join";
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
	public Map<String, Boolean> sendMail(HttpSession session, String emailName,String emailForm) {
		int ran = new Random().nextInt(100000)+10000;//10000~99999 
		String email = emailName +"@"+emailForm;
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		
		String subject ="회원 가입 인증 코드 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증코드는"+joinCode+"입니다.");
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("email", mailSerivce.send(subject,sb.toString(),"wjy1408@gmail.com",email,null));
		return map;
	}
	@RequestMapping(value="mailNum.do")
	public String sendNum(HttpSession session,String email){
		String emailNum = (String) session.getAttribute("joinCode");
		logger.info("................넘어오니");
		
		if(emailNum.equals(email)) {
			
			return "redirect:loginform.do";
		}else {
			
			return "redirect:joinform.do";
		}
		
	
	}
	@RequestMapping(value="memberInsert.do")
	public String memberInsert(HttpSession session,HttpServletResponse response,String pw,LoginDto dto,String phone1,String phone2,String phone3,String emailName,String emailForm, String emailNum) throws IOException {
		//디비에 암호화 저장
		String enpw=passEncoder.encode(pw);
		String emailKey = (String) session.getAttribute("joinCode");
		String phone = phone1+phone2+phone3;
		String email= emailName+"@"+emailForm;
		logger.info("................넘어오니");
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setPw(enpw);
		int res = biz.memberInsert(dto);
		PrintWriter out = response.getWriter();
		
		if(emailKey.equals(emailNum)) {
			if(res>0) {
				return "redirect:main.do";
			}else {
				return "redirect:joinform.do";
			}
		}else {
				logger.info("인증번호 틀림!");
				
				return "redirect:joinform.do";
		}
	}
	
	@RequestMapping(value="content.do")
	public String content() {
		logger.info("후원하기");
		
		return "content";
	}
	
	@RequestMapping(value="quiz.do")
	public String quiz() {
		logger.info("퀴즈 게임하기");
		
		return "quiz";
	}
	
	
	@RequestMapping(value="puzzle.do")
	public String puzzle() {
		logger.info("후원하기");
		
		return "puzzle";
	}
	
	@RequestMapping(value="crossword.do")
	public String crossword() {
		logger.info("후원하기");
		
		return "crossword";
	}
	@RequestMapping(value="test.do")
	public String test(@AuthenticationPrincipal String username) {
		
		logger.info("------------------------------"+username);
		return "redirect:main.do";
	}
}
