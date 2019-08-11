package com.my.four.crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.my.four.model.dto.TrashDto;

public class TrashList {
	

	public List<TrashDto> trashCrawling() {
		String str = "";
		String url = "http://www.daegu.go.kr/env/index.do?menu_id=00932929";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements elements = doc.select(".conBox");
//        	System.out.println(elements.toString());

		for (Element el : elements.select("tr td")) {
			if (el.text().equals("")) {
				continue;
			} else {
				str += el.text() + "#";
			}
		}
		String[] array = str.split("#");
		// dto에 담기
		TrashDto dto = new TrashDto();
		List<TrashDto> list = new ArrayList<TrashDto>();
		for (int i = 0; i < array.length; i++) {
			if (i % 3 == 1) {
				dto.setTrashName(array[i]);
			} else if (i % 3 == 2) {
				dto.setTrashLife(array[i]);
				list.add(dto);
				dto = new TrashDto();
			}
		}
		return list;
	}

	public List<TrashDto> imgRef() {
		String ref="";
		List<TrashDto> list = new ArrayList<TrashDto>();
		TrashDto dto = new TrashDto();
		for (int i = 1; i <= 14; i++) {
			if (i < 10) {
				ref = "http://www.daegu.go.kr/cmsh/daegu.go.kr/env/images/content/ico_reclaim0" + i + ".gif";
				dto.setImgRef(ref);
			} else {
				ref = "http://www.daegu.go.kr/cmsh/daegu.go.kr/env/images/content/ico_reclaim" + i + ".gif";
				dto.setImgRef(ref);
			}
			System.out.println(ref);
			list.add(dto);
			
		}
		return list;
	}

}
