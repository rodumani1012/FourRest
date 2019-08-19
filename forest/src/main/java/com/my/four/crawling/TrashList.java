package com.my.four.crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import com.my.four.model.dto.TrashDto;
@Component
public class TrashList {
	

	
	public List<TrashDto> trashCrawling() {
//		public static void main(String[] args) {
		
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
				str += "#" +el.text();
			}
			System.out.println(str);
		}
		String[] array = str.split("#");
		// dto에 담기
		TrashDto dto = new TrashDto();
		List<TrashDto> list = new ArrayList<TrashDto>();
		int count = 1;
		int name =1;
		int life=2;
		String ref[]=new String[30];
		for (int i = 0; i < array.length+12; i++) {
			System.out.println(array.length);
			if(i%3==0) {
					if(count<10) {
						ref[count]= "http://www.daegu.go.kr/cmsh/daegu.go.kr/env/images/content/ico_reclaim0" + count + ".gif";
						dto.setImgRef(ref[count]);
					}else {
						ref[count]= "http://www.daegu.go.kr/cmsh/daegu.go.kr/env/images/content/ico_reclaim" + count + ".gif";
						dto.setImgRef(ref[count]);
				}
					count++;
			}
			else if (i % 3 == 1) {
				dto.setTrashName(array[name]);
				name+=2;
			} else if (i % 3 == 2) {
				dto.setTrashLife(array[life]);
				life+=2;
				list.add(dto);
				dto = new TrashDto();
			}
		}
		return list;
	}

}
