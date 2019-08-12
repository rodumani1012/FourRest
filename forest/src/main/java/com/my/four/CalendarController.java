package com.my.four;

import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.model.biz.CalendarBiz;
import com.my.four.model.dto.CalendarDto;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());
	
	@RequestMapping(value="calendar.do")
	public String calendar(Model model) {
		
		biz.noticeupdate(today);
		
		List<String> list1 = new ArrayList<String>();
		
		for(int i = 0; i < biz.selectList().size(); i++) {
			if(biz.selectList().get(i).getCalrecpeo() == biz.selectList().get(i).getCalnowpeo()) {
				list1.add(biz.selectList().get(i).getCaltitle());
			}
		}
		if(list1.size() != 0) {
			biz.noticeupdate1(list1);
		}
	
		logger.info("달력 리스트");
		model.addAttribute("list", biz.selectList());
		
		return "calendar";
	}
	
	@RequestMapping(value="caldetail.do")
	public String caldetail(ModelMap model, String caltitle, Principal principal, HttpServletRequest requset) {
		
		HttpSession session = requset.getSession(true);
		session.setAttribute("id", principal.getName());
		
		logger.info("달력 세부리스트");
		
		model.addAttribute("dto", biz.selectOne(caltitle));
		model.addAttribute("list", biz.volList(caltitle));
		model.addAttribute("voldto", biz.volselectOne(caltitle, principal.getName()));
		
		return "calendar/caldetail";
	}
	
	@RequestMapping(value="calapply.do")
	public String calapply(ModelMap model, String caltitle, String id, Principal principal, HttpServletRequest requset) {
	
		HttpSession session = requset.getSession(true);
		session.setAttribute("id", principal.getName());
		
		int res = 0;
		int res1 = 0;
		
		res = biz.volinsert(caltitle, id);
		res1 = biz.volupdate(caltitle, id);
		
		if(res > 0 && res1 > 0) {
			logger.info("봉사 신청완료");
			model.addAttribute("dto", biz.selectOne(caltitle));
			model.addAttribute("list", biz.volList(caltitle));
			model.addAttribute("voldto", biz.volselectOne(caltitle, principal.getName()));
			return "calendar/caldetail";
		} else {
			logger.info("봉사 신청실패");
			model.addAttribute("dto", biz.selectOne(caltitle));
			model.addAttribute("list", biz.volList(caltitle));
			model.addAttribute("voldto", biz.volselectOne(caltitle, principal.getName()));
			return "calendar/caldetail";
		}
	}
	
	@RequestMapping(value="calcancel.do")
	public String calcancel(ModelMap model, String caltitle, String id, Principal principal, HttpServletRequest requset) {
		
		HttpSession session = requset.getSession(true);
		session.setAttribute("id", principal.getName());	
		int res = 0;
		
		res = biz.voldelete(caltitle, id);
		biz.volupdate(caltitle, id);
		
		if(res > 0) {
			model.addAttribute("dto", biz.selectOne(caltitle));
			model.addAttribute("list", biz.volList(caltitle));
			model.addAttribute("voldto", biz.volselectOne(caltitle, principal.getName()));

			logger.info("취소 완료");
			return "calendar/caldetail";
		} else {
			model.addAttribute("dto", biz.selectOne(caltitle));
			model.addAttribute("list", biz.volList(caltitle));
			model.addAttribute("voldto", biz.volselectOne(caltitle, principal.getName()));
			logger.info("취소 실패");
			return "calendar/caldetail";
		}
	}
	
	@RequestMapping(value="calinsert.do")
	public String calinsert() {
		
		return "calendar/calinsert";
	}

	@RequestMapping(value="calinsertres.do")
	public String calinsertres(CalendarDto dto, Model model) {
		
		int res = 0;
		
		res = biz.calinsert(dto);
		
		if(res > 0) {
			logger.info("봉사 만들기");
			return "redirect:calendar.do";
		} else {
			logger.info("봉사 만들기 실패");
			return "redirect:insert.do";
		}
	}
	
	@RequestMapping(value="caldelete.do")
	public String caldelete(String caltitle, String id) {
		
		int res = 0;
		
		res = biz.caldelete(caltitle, id);
		
		if(res > 0) {
			logger.info("봉사 삭제");
			return "redirect:calendar.do";
		} else {
			logger.info("봉사 삭제 실패");
			return "redirect:calendar.do";
		}
	}

}
