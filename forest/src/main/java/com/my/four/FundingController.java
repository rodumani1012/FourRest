package com.my.four;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.model.biz.FundingBiz;
import com.my.four.model.biz.FundingBizImpl;
import com.my.four.model.dto.FundingDto;

@Controller
public class FundingController {
	
	@Autowired
	private FundingBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="funlist.do")
	public String list(Model model) {
	
		logger.info("펀딩 리스트");
		model.addAttribute("list", biz.selectList());
		return "funding";
	}
	
	@RequestMapping(value="insert.do")
	public String insert() {
	
		logger.info("펀딩 등록");
		
		return "funding/fundinginsert";
	}
	
	@RequestMapping(value="insertres.do")
	public String insertres(FundingDto dto) {
		
		int res = biz.insert(dto);
		
		if(res > 0) {
			logger.info("펀딩 등록 완료");
			return "redirect:main.do";
		}else {
			logger.info("펀딩 등록 실패");
			return "redirect:insert.do";
		}
	}
	
	@RequestMapping(value="fundingdetail.do")
	public String fundingdetail() {
	
		logger.info("후원 내용 자세히 보기");
		
		return "funding/fundingdetail.jsp";
	}
	
	@RequestMapping(value="kakaopay.do")
	public String kakao(Model model, int funmoney) {
	
		logger.info("후원하기");
		model.addAttribute("funmoney", funmoney);
		return "funding/kakaopay.jsp";
	}
}
