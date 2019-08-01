package com.my.four;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.four.model.biz.ContestBoardBiz;
import com.my.four.model.dto.ContestBoardDto;
import com.my.four.paging.PageMaker;

@Controller
public class ContestBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ContestBoardController.class);

	@Autowired
	private ContestBoardBiz biz;

	@RequestMapping(value = "contest.do")
	public String contestboardlist(Model model,int pagenum,int contentnum) {
		List<ContestBoardDto> threelist = null;
		List<ContestBoardDto> list = null;
		logger.info("공모"+"P/c"+pagenum+"/"+contentnum);
		int totalcount = biz.getTotalCount();
		System.out.println("컨트롤러에서토탈넘"+totalcount);
		PageMaker pag = new PageMaker(totalcount,pagenum,contentnum);
		System.out.println("시작끝"+pag.getStartCon()+"/"+pag.getEndCon());
		
		list = biz.selectList(pag.getStartCon(),pag.getEndCon());
		threelist = biz.selectThree();
		
		model.addAttribute("threelist",threelist);
		model.addAttribute("list",list);
		model.addAttribute("threelist",biz.selectThree());
		model.addAttribute("pag",pag);
		return "contestboard";
	}
	
	@RequestMapping(value="contest_write.do")
	public String contestWriteboard(Model model,@ModelAttribute(value="ContestBoardDto") ContestBoardDto dto) throws UnsupportedEncodingException{ 
		logger.info("쓴다");
		int res = 0;
		System.out.println(dto.getWriter()+dto.getTitle()+dto.getContent());
		res = biz.boardInsert(dto);
		if(res>0) {
			model.addAttribute("pagenum",1);
			model.addAttribute("contentnum",9);
			return "redirect:contest.do";
		}else {
			model.addAttribute("pagenum",1);
			model.addAttribute("contentnum",9);
			return "redirect:contest.do";
		}
		
	}
	
	@RequestMapping(value="contest_Writteform.do")
	public String contestWritteform() {
		return "contestwrite";
	}
	
	@RequestMapping(value="contest_detail.do")
	public String contestDetail(Model model , int boardno) {
		ContestBoardDto dto = biz.selectOne(boardno);
		int groupno = dto.getBoardno();
		System.out.println(groupno);
		List<ContestBoardDto> listReply =biz.selectListReply(groupno);
		model.addAttribute("dto",dto);
		model.addAttribute("listReply",listReply);
		return "contestdetail";
	}
	
	@RequestMapping(value="contest_update.do")
	public String contestUpdate(Model model, ContestBoardDto dto) {
		int res=0;
		res = biz.boardUpdate(dto);
		if(res>0) {
			model.addAttribute("dto",biz.selectOne(dto.getBoardno()));
			return "contestdetail";
		}
		
		return "redirect:detail.do";
	}

	@RequestMapping(value="contest_delete.do")
	public String delete(int groupno) {
		int res =0;
		res = biz.boardDelete(groupno);
		if(res>0) {
			return "redirect:contest.do";
		}else {
			System.out.println("삭제안댐");
			return "redirect:contest.do";			
		}
	}
}