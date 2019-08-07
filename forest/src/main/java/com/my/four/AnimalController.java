package com.my.four;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.four.animal.AnimalList;
import com.my.four.model.biz.AnimalListBiz;
import com.my.four.model.dto.AnimalEndangeredJoinDto;
import com.my.four.model.dto.AnimalShelterListDto;
import com.my.four.paging.Paging;

@Controller
public class AnimalController {

	@Autowired
	AnimalListBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 보호소 목록으로  
	@RequestMapping(value = "ani_shelterList.do")
	public String ani_shelterlist(String txt_search, String page, Model model) {
		logger.info("보호소 목록으로!");

		String txt_s = txt_search;
		
		if (biz.aniGetTotalCount(txt_s) == 0) {
			
			// db에 저장하기
			AnimalList shelter_list = new AnimalList();
			biz.aniInsert(shelter_list.returnShelterList());
			
			// 페이징하기
			int totalCount = biz.aniGetTotalCount(txt_s);
			int pag = (page == null) ? 1 : Integer.parseInt(page);

			Paging paging = new Paging();

			paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
			paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
			paging.setTotalCount(totalCount);
			pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.

			List<AnimalShelterListDto> list = biz.aniSelectList(pag, paging.getPageSize(), txt_s);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("txt_search", txt_s);
			
			return "animalList/animalshelterlist";
			
		} else {
			// db에 있으면 그냥 페이징하기.
			int totalCount = biz.aniGetTotalCount(txt_s);
			int pag = (page == null) ? 1 : Integer.parseInt(page);

			Paging paging = new Paging();

			paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
			paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
			paging.setTotalCount(totalCount);
			pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.

			List<AnimalShelterListDto> list = biz.aniSelectList(pag, paging.getPageSize(), txt_s);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("txt_search", txt_s);
			
			return "animalList/animalshelterlist";
		}
	}

	// 멸종위기 목록으로 가는 메소드
	@RequestMapping(value = "ani_endangeredList.do")
	public String ani_endangeredList(String txt_search, String page, Model model, HttpServletRequest request) throws IOException {
		
		logger.info("멸종위기 목록으로!");
		
		String txt_s = txt_search;
		
		if (biz.aniGetTotalCountEndangeredCSV(txt_s) == 0) {
			
			// db에 저장하기
			AnimalList saveDb = new AnimalList();
			biz.aniInsertEndangeredImg(saveDb.returnEndangeredImg());
			biz.aniInsertEndangeredCSV(saveDb.returnEndangeredCSV(request.getSession().getServletContext().getRealPath("resources/assets/csv/endangeredList.csv")));
			biz.aniInsertEndangeredJoin(biz.aniSelectListEndangeredJoin());
			
			// 페이징하기
			int totalCount = biz.aniGetTotalCountEndangeredJoin(txt_s);
			int pag = (page == null) ? 1 : Integer.parseInt(page);
			Paging paging = new Paging();

			paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
			paging.setPageSize(20); // 한페이지에 불러낼 게시물의 개수 지정
			paging.setTotalCount(totalCount);
			pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.
			
			// 멸종위기 목록 불러오기
			List<AnimalEndangeredJoinDto> list = biz.aniSelectListEndangeredJoin(pag, paging.getPageSize(), txt_search);

			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("txt_search", txt_s);
			
			return "animalList/animalendangeredlist";
			
		} else {
			
			// db에 있으면 그냥 페이징하기.
			int totalCount = biz.aniGetTotalCountEndangeredJoin(txt_s);
			int pag = (page == null) ? 1 : Integer.parseInt(page);
			Paging paging = new Paging();

			paging.setPageNo(pag); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
			paging.setPageSize(20); // 한페이지에 불러낼 게시물의 개수 지정
			paging.setTotalCount(totalCount);
			pag = (pag - 1) * paging.getPageSize(); // select해오는 기준을 구한다.

			List<AnimalEndangeredJoinDto> list = biz.aniSelectListEndangeredJoin(pag, paging.getPageSize(), txt_search);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("txt_search", txt_s);

			return "animalList/animalendangeredlist"; 
		}
	}
}
