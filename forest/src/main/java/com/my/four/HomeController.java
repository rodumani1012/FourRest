package com.my.four;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.four.model.biz.CalendarBiz;
import com.my.four.model.biz.ContestListBiz;
import com.my.four.model.biz.FundingBiz;
import com.my.four.model.biz.LoginBiz;
import com.my.four.model.biz.MailService;
import com.my.four.model.dto.LoginDto;
import com.my.four.recaptcha.VerifyRecaptcha;

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
//	//recaptcha
//	@Autowired
//	private VerifyRecaptcha VerifyRecaptcha;
	
	@Autowired
	private ContestListBiz contestlistbiz;
	@Autowired
	private FundingBiz funbiz;
	@Autowired
	private CalendarBiz calbiz;
	
	@RequestMapping(value="main.do")
	public String main(Principal principal,HttpSession session) {
		if(principal==null) {
			return "main";
		} else {
			LoginDto dto = biz.memberInfo(principal.getName());
			session.setAttribute("dto1", dto);
			return "main";
		}
		
	}

	@RequestMapping(value = "sponsor.do")
	public String sponsor() {
		logger.info("후원하기");

		return "sponsor";
	}

	@RequestMapping(value = "loginform.do")
	public String loginform() {
		logger.info("로그인");
		
		return "member/login";
	}

	@RequestMapping(value = "joinform.do")

	public String joinform() {
		logger.info("회원가입");
		
		return "member/join";
	}

	@RequestMapping(value = "map.do")
	public String map() {
		logger.info("지도나와아");

		return "map";
	}
	
	@RequestMapping(value = "service.do")
	public String service(){
		
		logger.info("서비스전체보기");
		
		return "service";
	}
	
	@RequestMapping(value="idChk.do")
	public String idChk(String id,Model model) {
		logger.info("id=="+id);
		model.addAttribute("idchk",biz.idChk(id));
		return "member/idchk";
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
		
		
		if(emailKey.equals(emailNum)) {
			int res = biz.memberInsert(dto);
			if(res>0) {
				return "redirect:main.do";
			}else {
				return "redirect:joinform.do";
			}
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증번호가 다릅니다.')</script>");
			out.flush();
				
				return "member/joinform";
		}
	}

	@RequestMapping(value = "admin.do")
	public String admin(Model model,Principal prin) {
		logger.info("관리자");
		model.addAttribute("memcount",biz.memcount());
		model.addAttribute("concount",contestlistbiz.concount());
		model.addAttribute("fundcount",funbiz.totalfund());
		model.addAttribute("calcount",calbiz.calcount());
//		LoginDto dto = biz.memberInfo(prin.getName());
//		System.out.println("!!!!!!!!!!!!!!!!"+dto.getRole());
		return "admin/admin";
	}
	
	//kakao 로그인
	@RequestMapping(value="login.do")
	public String kakaoLogin(Model model, String name,String id ,HttpServletRequest request) {
		
		
				
		boolean snschk = biz.snsChk(id);
		logger.info("====pw"+name);
		model.addAttribute("id",id);
		model.addAttribute("name", name);
		if(snschk==true) {
			return "member/snsjoin";
		}else {
			LoginDto dto = biz.login(id);
			Authentication auth = new UsernamePasswordAuthenticationToken(dto, dto.getPw(),dto.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(auth);
			HttpSession session = request.getSession(true);
			LoginDto dto1 = biz.memberInfo(id);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			return "redirect:main.do";
		}
		
	}
	
	@RequestMapping(value="mypagepwchk.do")
	public String mypagepwchk() {
		
		return "member/mypagepwchk";
	}
	@RequestMapping(value="youtube.do")
	public String youtube() {
		
		return "youtube/youtube";
	}
	
	@RequestMapping(value="mypage.do")
	public String mypage(String pwchk,Principal principal,Model model) {
		 
			LoginDto dto1= biz.memberInfo(principal.getName());
			String phone=dto1.getPhone().substring(3, 7);
			String phone2=dto1.getPhone().substring(7, 11);
			String[] email=dto1.getEmail().split("@");
			String emailName = email[0];
			model.addAttribute("dto",dto1);
			model.addAttribute("phone",phone);
			model.addAttribute("phone2",phone2);
			model.addAttribute("emailName",emailName);
			return "member/mypage";	
		
	}
	@RequestMapping(value="pwChange.do")
	public String pwChange(String pwchk,Principal principal,Model model) {
		LoginDto dto = biz.pwChk(principal.getName());
		boolean chk = passEncoder.matches(pwchk, dto.getPw());
		if(chk==true) {
			return "member/pwchange";
		}else {
			return "mypagepwchk.do";
		}
		
	}
	//내정보에서 비밀번호 변경
	@RequestMapping(value="pwChangeConfirm.do")
	public String pwChangeConfirm(String pw, Principal principal,ServletResponse response,String newPw) throws IOException {
		String id=principal.getName();
		LoginDto dto = biz.pwChk(id);
		boolean chk = passEncoder.matches(pw, dto.getPw());
		if(chk==true) {
			System.out.println("111111111111"+id);
			String encodePw = passEncoder.encode(newPw);
			int res = biz.pwUpdate(encodePw, id);
			if(res>0) {
				System.out.println("-------------------------------"+res);
				return "redirect:main.do";
			}else {
				System.out.println("------------------여긴가");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('변경한 비밀번호를 확인 해주세요.')</script>");
				out.flush();
				return "member/pwchange";
			}
			
		}else {
			System.out.println("여긴가");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('기존 비밀번호가 다릅니다.')</script>");
			out.flush();
			return "member/pwchange";
		}
	}
	@RequestMapping(value="memberUpdate.do")
	public String memberUpdate(LoginDto dto,String phone1,String phone2,String phone3,String emailName,String emailForm) {
		
		String phone = phone1+phone2+phone3;
		String email= emailName+"@"+emailForm;
		dto.setPhone(phone);
		dto.setEmail(email);
		int res = biz.memberUpdate(dto);
		if(res>0) {
			
			return "redirect:main.do";
		}else {
			return "redirect:memberUpdate.do";
		}
		
	}
	
	@RequestMapping(value = "findId.do")
	public String findId() {
		return "member/findid";
	}
	//아이디 찾기 이메일 전송
	@RequestMapping(value="findIdConfirm.do",  produces = "application/json")
	public String findIdConfirm(String name,String emailName,String emailFormWrite,HttpServletResponse response) throws IOException {
		String email = emailName+"@"+emailFormWrite;
		System.out.println("-------------"+emailFormWrite);
		System.out.println("-------------"+name);
		LoginDto dto = biz.findId(name, email);
		if(dto!=null) {
		String id= dto.getId();
		String subject ="회원님의 아이디 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 아이디는"+id+"입니다.");
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("email", mailSerivce.send(subject,sb.toString(),"wjy1408@gmail.com",email,null));
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('메일을 전송 했습니다.')</script>");
			out.flush();
			return "main";
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이름이나 이메일을 확인 해주세요.')</script>");
			out.flush();
			return "member/findid";
		}
		
		
	}
	@RequestMapping(value = "findPw.do")
	public String findPw() {

		return "member/findpw";
	}
	//비밀번호 찾기 이메일 보내기
	@RequestMapping(value="mailSendPw.do",produces = "application/json",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> mailSendPw(HttpSession session,String id, String emailName,String emailForm,HttpServletResponse response) throws IOException {
		String email = emailName+"@"+emailForm;
		LoginDto dto = biz.findPw(id, email);
		if(dto!=null) {
			int ran = new Random().nextInt(100000)+10000;//10000~99999 
			String joinCode = String.valueOf(ran);
			session.setAttribute("joinCode", joinCode);
			session.setAttribute("id", id);
			String subject ="비밀번호 인증 코드 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 인증코드는"+joinCode+"입니다.");
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("email", mailSerivce.send(subject,sb.toString(),"wjy1408@gmail.com",email,null));
			return map;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디나 이메일을 확인 해주세요.')</script>");
			out.flush();
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("email", false);
			return map;
			
		}
		
	}
	
	//회원 탈퇴
	@RequestMapping(value="withdrawPwChk.do")
	public String withdrawPwChk() {
		return "member/withdrawpwchk";
	}
	
	@RequestMapping(value="withdraw.do")
	public String withdraw(Principal principal) {
		int res =biz.withdrawMember(principal.getName());
		if(res>0) {
			return "redirect:main.do";
		}else {
			return "redirect:joinform.do";
		}
		
	}
	
	@RequestMapping(value="withdrawMember.do")
	public String withdrawMember(String pwchk,Principal principal,Model model,ServletResponse response) throws IOException {
		LoginDto dto = biz.pwChk(principal.getName());
		boolean chk = passEncoder.matches(pwchk, dto.getPw());
		if(chk==true) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>"
					+ "if(confirm('회원 탈퇴를 하시겠습니까?') == true){location.href='withdraw.do'}"
					+ "else{history.back()}"
					+ "</script>");
			out.flush();
			
			
			return "main";
		}else {
			return "member/withdrawpwchk";
		}
		
	}
	
	//비밀번호 찾기
	@RequestMapping(value="findPwConfirm.do")
	public String findPwConfirm(String number,HttpServletResponse response,HttpSession session) throws IOException {
			String emailKey = (String) session.getAttribute("joinCode");
			if(number.equals(emailKey)) {
				return "member/changepw";
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('인증번호가 다릅니다.')</script>");
				out.flush();
				return "member/findpw";
			}
			
	}
	// 비밀번호 찾기에서 비밀번호 바꾸기
	@RequestMapping(value="changePw.do")
	public String pwChange(String pw,String pwchk,HttpServletResponse response,HttpSession session) throws IOException {
		String id = session.getAttribute("id")+"";
		String encodePw = passEncoder.encode(pw);
		int res = biz.pwUpdate(encodePw, id);
		if(pw.equals(pwchk)) {
			if(res>0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('수정이 완료 됐습니다.')</script>");
				out.flush();
				return "main";
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호를 확인하세요')</script>");
				out.flush();
				return "member/changepw";
			}
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('동일한 비밀번호를 쓰세요.')</script>");
			out.flush();
			return "member/changepw";
		}
	}
//	
//	@Scheduled(cron="0 0/10 * * * ?")
//	public void check() {
//		List<LoginDto> list = biz.allMember();
//		
//		for (int i = 0; i<list.size();i++) {
//			String perpay = null;
//			String id = list.get(i).getId();
//			System.out.println("id=========="+id);
//			LoginDto dto = biz.memberInfo(id);
//			perpay = dto.getPerpay();
//			if(perpay=="Y") {
//				
//			}
//		}
//		
//	}

	
	
	@ResponseBody
    @RequestMapping(value = "VerifyRecaptcha.do", method = RequestMethod.POST)
    public int VerifyRecaptcha(HttpServletRequest request) {
        VerifyRecaptcha.setSecretKey("6LewgLEUAAAAAGv53SfBX_cHOgiNrxydgIlAnQ2-");
        String gRecaptchaResponse = request.getParameter("recaptcha");
        System.out.println("왔니");
        System.out.println(gRecaptchaResponse);
        //0 = 성공, 1 = 실패, -1 = 오류
        try {
            if(VerifyRecaptcha.verify(gRecaptchaResponse))
                return 0;
            else return 1;
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
    }
	
	@RequestMapping(value = "/callback.do")
	public String navLogin(HttpServletRequest request) throws Exception {  
		return "member/navercallback";
	}
	
	@RequestMapping(value="/naverlogin.do")
	public String naverLogin(HttpServletRequest request,Model model) throws IOException, ParseException {
		HttpSession session = request.getSession();
		String token = (String) session.getAttribute("access_token"); // 네이버 로그인 접근 토큰
		String header = "Bearer " + token;
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // 정상 호출
               br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
               br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response_buffer = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
               response_buffer.append(inputLine);
            }
            br.close();

            System.out.println(response_buffer.toString());

            JSONParser parser = new JSONParser();

            JSONObject result = (JSONObject) parser.parse(response_buffer.toString());

            String id = (String) ((JSONObject) result.get("response")).get("id");
            String name = (String) ((JSONObject) result.get("response")).get("name");
            
            boolean snschk = biz.snsChk(id);
    		logger.info("====pw"+name);
    		model.addAttribute("id",id);
    		model.addAttribute("name", name);
    		if(snschk==true) {
    			return "member/snsjoin";
    		}else {
    			LoginDto dto = biz.login(id);
    			Authentication auth = new UsernamePasswordAuthenticationToken(dto, dto.getPw(),dto.getAuthorities());
    			SecurityContext securityContext = SecurityContextHolder.getContext();
    			securityContext.setAuthentication(auth);
    			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
    			
    			return "redirect:main.do";
		} 
		
	}
	
	@RequestMapping(value = "site.do")
	public String site() {
	   logger.info("stie");
	
	   return "site";
	}
	
	@RequestMapping("admin_memlist.do")
	public String memlist(Model model) {
		List<LoginDto> memlist = null;
		memlist = biz.memlist();
		model.addAttribute("memlist",memlist);
		for(LoginDto dto : memlist) {
			System.out.println(dto.getUsername()+"/"+dto.getEnabledDb());
		}
		return "admin/admin_memlist";
	}
	@RequestMapping("admin_memupdate.do")
	@ResponseBody
	public Map<String,Object> memupdate(Model model,String usernum,String phone,String email,String addr) {
		Map<String,Object> map = new HashMap<String,Object>();
		LoginDto dto = new LoginDto(Integer.parseInt(usernum),phone,email,addr);
		int res = biz.memupdate(dto);
		if(res>0) {
			map.put("code", "ok");
			return map;
		}
		map.put("code", "no");
		return map;
	}
	@RequestMapping("adminchat.do")
	public String adminchat() {
		return "admin/chatlist";
	}
	
	@RequestMapping("admin_memsearch.do")
	public String admin_memsearch(String idsearch,Model model) {
		List<LoginDto> list = null;
		list = biz.adminsearch(idsearch);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchlist", list);
		model.addAttribute("memlist", list);
		
		return "admin/admin_memlist";
		
		
	}
	@RequestMapping("admin_memdelete.do")
	public String admin_memdelete(int usernum) {
		int res = biz.userdel(usernum);
		if (res>0) {
			System.out.println("ok");
			return "redirect:admin_memlist.do";
		}
		System.out.println("no");
		return "redirect:admin_memlist.do";
	}
	
	@RequestMapping("admin_gotochat.do")
	public String admin_gotochat() {
		return "admin/admin_chatlist";
	}
	
}
