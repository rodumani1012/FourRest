package com.my.four;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.model.biz.FreeboardBiz;
import com.my.four.model.dto.AnimalDisturbDto;
import com.my.four.model.dto.FreeboardDto;
import com.my.four.model.dto.FreecommentDto;
import com.my.four.paging.Paging;

@Controller
public class FreeboardController {
	
	@Autowired
	private FreeboardBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="freeboardlist.do")
	public String freeboardlist(String category, String txt_search, String page, Model model) {
		
		logger.info("자유게시판 리스트");
		
		// 페이징하기
		int totalCount = biz.freeboardGetTotalCount(category, txt_search);
		int pag = (page == null) ? 1 : Integer.parseInt(page);

		Paging paging = new Paging();

		paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalCount);
		pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.

		List<FreeboardDto> list = biz.freeboardList(pag, paging.getPageSize(), category, txt_search);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("txt_search", txt_search);
		model.addAttribute("totalCount", totalCount);
		
		return "freeboard/freeboardlist";
	}
	
	@RequestMapping(value="freedetail.do")
	public String freedetail(ModelMap model, int free_seq) {

		logger.info("freedetail");
		model.addAttribute("dto", biz.freedetail(free_seq));
		model.addAttribute("list", biz.freecommentList(free_seq));
		return "freeboard/freedetail";
	}
	
	@RequestMapping(value="freeupdate.do")
	public String freeupdate(Model model, int free_seq) {
		
		logger.info("freeupdate");
		model.addAttribute("dto", biz.freedetail(free_seq));
		return "freeboard/freeupdate";
	}
	
	@RequestMapping(value="freeupdateres.do")
	public String freeupdateres(int free_seq, String title, String content, Model model) {
		
		logger.info("freeupdateres");
		int res = biz.freeupdate(free_seq, title, content);
		
		if(res > 0) {
			System.out.println("update 완료");
			model.addAttribute("dto", biz.freedetail(free_seq));
			return "freeboard/freedetail";
		} else {
			System.out.println("update 실패");
			return "redirect:freeupdate.do";
		}
	}

	@RequestMapping(value="freedelete.do")
	public String freedelete(Model model, int free_seq) {

		logger.info("freedelete");
		int res = biz.freedelete(free_seq);
		
		if(res > 0) {
			System.out.println("delete 성공");
			return "redirect:freeboardlist.do";
		} else {
			System.out.println("delete 실패");
			model.addAttribute("dto", biz.freedetail(free_seq));
			return "freeboard/freedetail";
		}
	}
	
	@RequestMapping(value="freeinsert.do")
	public String freeinsert() {
		
		logger.info("freeinsert");
		return "freeboard/freeinsert";
	}

	@RequestMapping(value="freeinsertres.do")
	public String freeinsertres(@ModelAttribute FreeboardDto dto) {
		
		logger.info("freeinsertres");
		
		int res = biz.freeinsert(dto);
		
		if (res > 0) {
			System.out.println("글 작성 완료");
			return "redirect:freeboardlist.do";
		} else {
			System.out.println("글 작성 실패");
			return "redirect:freeinsert.do";
		}
	}
	
	@RequestMapping(value="commentinsert.do")
	public String commentinsert(Model model, int free_seq, String user_id, String content) {
		
		logger.info("commentinsert");
		int res = biz.commentinsert(free_seq, user_id, content);
		
		if(res > 0) {
			System.out.println("댓글 작성 성공");
			model.addAttribute("dto", biz.freedetail(free_seq));
			model.addAttribute("list", biz.freecommentList(free_seq));
			return "freeboard/freedetail";
		} else {
			System.out.println("댓글 작성 실패");
			model.addAttribute("dto", biz.freedetail(free_seq));
			model.addAttribute("list", biz.freecommentList(free_seq));
			return "freeboard/freedetail";
		}
		
	}
	
	@RequestMapping(value="commdelete.do")
	public String commdelete(Model model, int comm_seq, int free_seq) {
		
		logger.info("commdelete");
		int res = biz.commdelete(comm_seq);
		
		if(res > 0) {
			System.out.println("댓글 삭제 성공");
			model.addAttribute("dto", biz.freedetail(free_seq));
			model.addAttribute("list", biz.freecommentList(free_seq));
			return "freeboard/freedetail";
		} else {
			System.out.println("댓글 삭제 실패");
			model.addAttribute("dto", biz.freedetail(free_seq));
			model.addAttribute("list", biz.freecommentList(free_seq));
			return "freeboard/freedetail";
		}
	}
	
	@RequestMapping(value="commupdate.do")
	public String commupdate(Model model, int comm_seq, int free_seq) {

		logger.info("commupdate");

		model.addAttribute("dto", biz.freedetail(free_seq));
		model.addAttribute("list", biz.freecommentList(free_seq));
		return "freeboard/freecommupdate";
	}
	
	@RequestMapping(value="commupdateres.do")
	public String commupdateres(Model model, int comm_seq, int free_seq) {
		
		logger.info("commupdate");
		int res = biz.commdelete(comm_seq);
		
		if(res > 0) {
			System.out.println("댓글 삭제 성공");
			model.addAttribute("dto", biz.freedetail(free_seq));
			model.addAttribute("list", biz.freecommentList(free_seq));
			return "freeboard/freedetail";
		} else {
			System.out.println("댓글 삭제 실패");
			model.addAttribute("dto", biz.freedetail(free_seq));
			model.addAttribute("list", biz.freecommentList(free_seq));
			return "freeboard/freedetail";
		}
	}
	
}
