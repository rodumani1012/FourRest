package com.my.four;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.model.biz.FundingBiz;
import com.my.four.model.biz.FundingLoadBiz;
import com.my.four.model.dto.FundingDto;
import com.my.four.model.dto.FundingLoadDto;

@Controller
public class FundingController {
	
	@Autowired
	private FundingBiz biz;
	
	@Autowired
	private FundingLoadBiz Loadbiz;
	
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
	public String insertres(FundingDto dto, Model model) {
		
		int res = biz.insert(dto);
		
		if(res > 0) {
			logger.info("펀딩 등록 완료");
			model.addAttribute("list", biz.selectList());
			return "funding";
		}else {
			logger.info("펀딩 제목이 중복되었습니다. 펀딩의 제목을 변경해주세요.");
			return "redirect:insert.do";
		}
	}
	
	@RequestMapping(value="fundingdetail.do")
	public String fundingdetail(Model model, String funtitle) {
	
		logger.info("후원 내용 자세히 보기");
		model.addAttribute("dto", biz.selectOne(funtitle));
		return "funding/fundingdetail";
	}
	
	@RequestMapping(value="fundingpay.do")
	public String fundingpay(Model model, String funtitle) {
		
		logger.info("후원하기");
		model.addAttribute("funtitle", funtitle);
		return "funding/fundingpay";
	}
	
	@RequestMapping(value="kakaopay.do")
	public String kakao(ModelMap modelmap, String funtitle, int funmoney) {
		
		logger.info("후원하기");
		
		modelmap.addAttribute("funtitle", funtitle);
		modelmap.addAttribute("funmoney", funmoney);
		
		return "funding/kakaopay";
	}
	
	@RequestMapping(value="kakaopayload.do")
	public String kakaoload(@ModelAttribute FundingLoadDto dto) {
	
		int res = Loadbiz.insert(dto);

		Map<String, Object> map = Loadbiz.select(dto.getFuntitle());
		Map<String, Object> map1 = Loadbiz.select1(dto.getFuntitle());

		int res1 = 0;
		int res2 = 0;
		
		res1 = biz.funupdate((String)map.get("funtitle"), (Integer)map.get("funpay"));
		res2 = biz.funupdate1((String)map1.get("funtitle"), (Integer)map1.get("funcount"));
		
		if(res > 0 && res1 > 0 && res2 > 0) {
			logger.info("후원 완료");
			return "redirect:funlist.do";
		}else {
			logger.info("후원 오류");
			return "redirect:funlist.do";
		}
	}
	
	@RequestMapping(value="muldel.do")
	public String muldel(Model model, String funtitle, String id) {
	
		System.out.println(funtitle);
		System.out.println(id);
		
		int res = biz.update(funtitle, id);
		
		if(res > 0) {
			logger.info("펀딩 삭제 완료");
			return "redirect:funlist.do";
		}else {
			logger.info("펀딩 삭제 오류");
			return "redirect:funlist.do";
		}
	}
	
}
