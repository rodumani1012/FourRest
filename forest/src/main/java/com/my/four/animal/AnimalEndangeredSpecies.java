package com.my.four.animal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.my.four.model.dto.AnimalEndangeredSpeciesDto;
import com.my.four.model.dto.AnimalShelterListDto;

public class AnimalEndangeredSpecies {

	public List<AnimalEndangeredSpeciesDto> returnEndangered() {
		/*
		 * Document : 연결해서 가져온 HTML 전체 문서 Element : Document의 HTML 요소 Elements :
		 * Element가 모인 자료
		 */
		String str = "";

		// 1페이지부터 30페이지까지의 데이터
		for (int i = 1; i <= 14; i++) {

			String url = "https://species.nibr.go.kr/endangeredspecies/rehome/exlist/exlist.jsp?1=1&1=1&search_key=all&search_yn=Y&sch_gbn=ex&chk_rcomm_group_all=Y&sch_rcomm_group0=MM&sch_rcomm_group1=AV&sch_rcomm_group2=RP&sch_rcomm_group3=AM&sch_rcomm_group4=-P&sch_rcomm_group5=IN&sch_rcomm_group6=IV&sch_rcomm_group7=VP&sch_rcomm_group8=AL&sch_rcomm_group9=FG&chk_ex_rl_all=Y&sch_ex1=Y&sch_ex2=Y&sch_sort=cls_kname&unit_count=20&sch_view_type=photo&page_count="
					+ i;
			String selector = ".wrapPost > div > a > img, .desc > a > li, .wrapPost > p";
			Document doc = null;

			try {
				doc = Jsoup.connect(url).post(); // post방식으로 url을 연결하여 값을 가져와 doc에 담음.
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}

			Elements contents = doc.select(selector); // doc(HTML문서)에서 (selector)내용을 가져옴.

			for (Element element : contents) {
				if (element.attr("src").equals("")) {
					if (element.text().equals("")) {
						continue;
					} else {
						str += element.text() + "#";
					}
				} else {
					if (element.attr("src").startsWith("../../upload_data")) {
						str += element.attr("src").replaceAll("../../", "https://species.nibr.go.kr/endangeredspecies/")
								+ "#";
					} else {
						str += "https://species.nibr.go.kr" + element.attr("src") + "#";
					}
				}
			}
		}
		// 배열에 담기
		String[] endangered = str.split("#");

		AnimalEndangeredSpeciesDto dto = new AnimalEndangeredSpeciesDto();
		List<AnimalEndangeredSpeciesDto> list = new ArrayList<AnimalEndangeredSpeciesDto>();

		for (int i = 0; i < endangered.length; i++) {
			if (i % 3 == 0) {
				dto.setImg(endangered[i]);
			}
			if (i % 3 == 1) {
				dto.setName(endangered[i]);
			}
			if (i % 3 == 2) {
				dto.setGrade(endangered[i]);
				list.add(dto);
				dto = new AnimalEndangeredSpeciesDto();
			}
		}
		return list;
	}
}
