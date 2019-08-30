package com.my.four;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.four.model.biz.ContestBoardBiz;
import com.my.four.model.biz.ContestListBiz;
import com.my.four.model.biz.LoginBiz;
import com.my.four.model.dto.ContestBoardDto;
import com.my.four.model.dto.ContestListDto;
import com.my.four.model.dto.LoginDto;
import com.my.four.model.dto.StarRecordDto;
import com.my.four.paging.PageMaker;

@Controller
public class ContestBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ContestBoardController.class);

	@Autowired
	private ContestBoardBiz biz;

	@Autowired
	private ContestListBiz listbiz;
	
	@Autowired
	private LoginBiz logBiz ;

	// 관리자 conlist보여주는페이지로가기
	@RequestMapping("admin_conlist.do")
	public String admin_conlist(Model model) {
		List<ContestListDto> conlist = null;
		conlist = listbiz.selectList();
		model.addAttribute("conlist", conlist);
		return "admin/admin_conlist";
	}

	// 관리자 conlist작성하는페이지로가기
	@RequestMapping("admin_conlistwrite.do")
	public String admincontestwrite() {
		return "admin/admin_conlistwrite";
	}

	// 관리자 공보작성받아서 db넣고 공모목록으로돌아가기
	@RequestMapping("admin_conlistwriteform.do")
	public String admin_conlistwriteform(Model model, @ModelAttribute(value = "ContestBoardDto") ContestListDto dto) {
		logger.info("<admin_conlistwriteform.do>");
		int res = 0;
		String[] strarr = dto.getContent().split("<img ");
		if (strarr.length == 1) {
			dto.setReppic("<img src='http://placehold.it/400x400'>");
		} else {
			String[] arr = strarr[1].split("style|>");
			dto.setReppic("<img " + arr[0] + ">");
		}
		res = listbiz.insert(dto);
		System.out.println(dto);
		if (res > 0) {
			System.out.println("성공");
			return "redirect:admin_conlist.do";
		} else {
			return "redirect:admin_conlist.do";
		}

	}

	// 유저 contestmain가기
	@RequestMapping("contest_main.do")
	public String contest_main(Model model) {
		List<ContestListDto> conlist = null;
		List<ContestBoardDto> topthree = null;
		conlist = listbiz.selectList();
		topthree = biz.selectThree(0);
		model.addAttribute("conlist", conlist);
		model.addAttribute("threelist", topthree);
		return "contest/contest_main";
	}

	// 유저가 출품작 작성하는폼으로가기
	@RequestMapping("contest_postform.do")
	public String contest_postform(Model model) {
		List<ContestListDto> conlist = null;
		conlist = listbiz.selectList();
		model.addAttribute("conlist", conlist);
		return "contest/contest_postform";
	}

	// 작성해서 insert까지하고 메인으로돌아가기
	@RequestMapping("contest_post.do")
	public String contest_post(@ModelAttribute ContestBoardDto dto) {
		int res = 0;
		String[] strarr = dto.getContent().split("<img ");
		if (strarr.length == 1) {
			dto.setReppic("<img src='http://placehold.it/400x400'>");
		} else {
			String[] arr = strarr[1].split("style|>");
			dto.setReppic("<img " + arr[0] + ">");
		}
		res = biz.boardInsert(dto);
		if (res > 0) {
			System.out.println("성공");

			return "redirect:contest_main.do";
		} else {
			System.out.println("실패");
			return "redirect:contest_main.do";
		}
	}

	// 출품 list 보러가기 - 파라미터주세요 6개씩하고 높은 123위 3개전시
	@RequestMapping("contest_postlist.do")
	public String contest_postlist(Model model, @RequestParam("conlistno") int conlistno, int pagenum, int contentnum) {
		List<ContestBoardDto> list = null;
		List<ContestBoardDto> threelist = null;
		List<ContestListDto> conlist = null;
		int totalcount = biz.getCount(conlistno);
		System.out.println("컨트롤러에서토탈넘" + totalcount);
		PageMaker pag = new PageMaker(totalcount, pagenum, contentnum);
		System.out.println("시작끝" + pag.getStartCon() + "/" + pag.getEndCon());
		list = biz.selectListOption(conlistno, pag.getStartCon(), pag.getEndCon());
		threelist = biz.selectThree(conlistno);
		conlist = listbiz.selectList();
		ContestListDto listDto = listbiz.selectOne(conlistno);
		model.addAttribute("list", list);
		model.addAttribute("threelist", threelist);
		model.addAttribute("conlist", conlist);
		model.addAttribute("pag", pag);
		model.addAttribute("conlistno", conlistno);
		model.addAttribute("listDto", listDto);
		return "contest/contest_postlist";
	}

	// list의 디테일보러간다
	@RequestMapping("conlistdetail.do")
	public String detailConlist(Model model, int conlistno) {
		ContestListDto conDto = null;
		conDto = listbiz.selectOne(conlistno);
		model.addAttribute("conDto", conDto);
		return "contest/conlistdetail";
	}

	// 공모지원한사람꺼 detail보러가기
	@RequestMapping(value = "contest_detail.do")
	public String contestDetail(Model model, int boardno) {
		ContestBoardDto dto = biz.selectOne(boardno);
		int groupno = dto.getBoardno();
		System.out.println(groupno);
		List<ContestBoardDto> listReply = biz.selectListReply(groupno);
		model.addAttribute("dto", dto);
		model.addAttribute("listReply", listReply);
		Object obj = null;

		return "contest/contest_postdetail";
	}

	// 별점 ! 파라미터잘주세요
	@RequestMapping("starupdate.do")
	@ResponseBody
	public Map<String,Object> starupdate(@RequestParam("starCount") String newstar, @RequestParam("boardNum") String boardno,
			@RequestParam("userName") String userName) {
		StarRecordDto starDto = null;
		LoginDto logDto = null;
		logDto = logBiz.login(userName);
		int userno = logDto.getUsernum();
		int boardnum = Integer.parseInt(boardno);
		int newstarno = Integer.parseInt(newstar);
		//메시지담기위한곳
		String msg = "";
		starDto = biz.amialready(userno, boardnum);
		if(starDto!=null)
			msg="별점을 수정하였습니다!";
		else
			msg="별점을 주었습니다!";
		int resultcnt = biz.starProc(userno, boardnum, newstarno);
		if(resultcnt>1) {
			System.out.println("updateok");
			ContestBoardDto dto = biz.selectOne(boardnum);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("updatedStar", dto.getLikerate()+"");
			map.put("CODE", "OK");
			map.put("msg", msg);
			return map;
		}else {
			System.out.println("retry");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("updatedStar", 5.0+"");
			map.put("CODE", "NO");
			return map;
		}
	}

	// 관리자 공모글 삭제 매퍼확인
	@RequestMapping("contest_deletelist.do")
	public String contest_deletelist(int boardno) {
		int res = 0;
		res = listbiz.delete(boardno);
		if (res > 0)
			return "redirect:admin_conlist.do";
		return "redirect:admin_conlist.do";
	}

	// 참여글 삭제
	@RequestMapping(value = "contest_delete.do")
	public String delete(@RequestParam int groupno, Model model) {
		int res = 0;
		res = biz.boardDelete(groupno);
		System.out.println(groupno);
		model.addAttribute("pagenum", 1);
		model.addAttribute("contentnum", 9);
		if (res > 0) {
			return "redirect:contest.do";
		} else {
			System.out.println("삭제안댐");
			return "redirect:contest.do";
		}
	}

	// 댓글등록
	@RequestMapping("contest_replyform.do")
	public String postreply(@ModelAttribute ContestBoardDto dto, Model model) {
		int parentno = dto.getBoardno();
		int cnt = biz.replyCntup(parentno);
		int rescnt = biz.ansProc(dto);
		if(cnt>0&&rescnt>1) {
			System.out.println("댓글등록");
			return "redirect:contest_detail.do?boardno=" + parentno;
		}else {
			System.out.println("댓글실패");
			return "redirect:contest_detail.do?boardno=" + parentno;
		}
	}
	
	@RequestMapping("contest_ansdelete.do")
	public String ansdelete(int boardno,int pboardno) {
		int res =0;
		res = biz.ansdel(boardno);
		if(res>0) {
			return "redirect:contest_detail.do?boardno=" + pboardno;
		}
		return "redirect:contest_detail.do?boardno=" + pboardno;
	}


//	@RequestMapping(value="contest_update.do")
//	public String contestUpdate(Model model, ContestBoardDto dto) {
//		int res=0;
//		System.out.println(dto.getWriter()+dto.getTitle()+dto.getContent());
//		Object type=dto.getWriter().getClass();
//		String[] str = dto.getContent().split("<img");
//		String[] str2 = str[1].split(">");
//		StringBuffer sb = new StringBuffer();
//
//		String picture = "<img "+str2[0]+">";
//		System.out.println(picture);
//		dto.setReppic(picture);
//		res = biz.boardUpdate(dto);
//		model.addAttribute("pagenum",1);
//		model.addAttribute("contentnum",9);
//		if(res>0) {
//			model.addAttribute("dto",biz.selectOne(dto.getBoardno()));
//			return "contestdetail";
//		}
//		return "redirect:detail.do";
//	}

}