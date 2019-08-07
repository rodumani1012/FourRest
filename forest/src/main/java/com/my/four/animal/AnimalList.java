package com.my.four.animal;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.my.four.model.dto.AnimalEndangeredSpeciesDto;
import com.my.four.model.dto.AnimalShelterListDto;

public class AnimalList {
	
	// 동물보호소 목록을 리턴하는 메소드
	public List<AnimalShelterListDto> returnShelterList() {
		/*
		  Document : 연결해서 가져온 HTML 전체 문서
		  Element : Document의 HTML 요소
		  Elements : Element가 모인 자료 
		 */
		String str = "";
		
		// 1페이지부터 30페이지까지의 데이터
		for (int i = 1; i <= 30; i++) {
			
			String url = "http://www.animal.go.kr/portal_rnl/map/mapInfo2.jsp?s_date=&e_date=&s_upr_cd=&s_org_cd=&s_up_kind_cd=&s_kind_cd=&s_name=&pagecnt="+i;
			String selector = "tr td";
			Document doc = null;
			
			try {
				doc = Jsoup.connect(url).post(); // post방식으로 url을 연결하여 값을 가져와 doc에 담음.
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
			
			Elements contents = doc.select(selector); // doc(HTML문서)에서 (selector)내용을 가져옴.
			
			for(Element element : contents) {
				if (element.text().equals("")) {
					continue;
				} else {
					str += element.text()+"#";	
				}
			}
		}
		
		// 목록을 배열에 담기
		String[] centerList = str.split("#");
		
		// 구분해서 dto에 담기
		AnimalShelterListDto dto = new AnimalShelterListDto();
		List<AnimalShelterListDto> list = new ArrayList<AnimalShelterListDto>();
		for(int i = 0; i < centerList.length; i++) {
			if(i%4 == 0) {
				dto.setArea(centerList[i]);
			}
			if(i%4 == 1) {
				dto.setCenterName(centerList[i]);
			}
			if(i%4 == 2) {
				dto.setPhoneNumber(centerList[i]);
			}
			if(i%4 == 3) {
				dto.setCenterAddr(centerList[i]);
				list.add(dto);
				dto = new AnimalShelterListDto();
			}
		}
		
		return list;
		
		/*
		// dto 리스트를 json배열 형태로 변환하기.
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < list.size(); i++) {
			JSONObject data = new JSONObject();
			data.put("area", list.get(i).getArea());
			data.put("centerName", list.get(i).getCenterName());
			data.put("phoneNumber", list.get(i).getPhoneNumber());
			data.put("centerAddr", list.get(i).getCenterAddr());
			
			jsonArray.add(i, data);
		}
		// json배열을 jsonObject에 넣기
		JSONObject obj = new JSONObject();
		obj.put("list", jsonArray);
		*/

		/*
		 * JSON 파일 만들기
		try {
			File dir = new File("C:\\forest");
			if(dir.mkdir()) {
				System.out.println("디렉토리 생성 완료");
			} else {
				System.out.println("디렉토리 생성 실패");
			}
			FileWriter file = new FileWriter("C:\\forest\\animalshelterlist.json");
			file.write(obj.toJSONString());
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
	}
	
	// 이미지 src와 alt를 list로 돌려주는 메소드
	public List<AnimalEndangeredSpeciesDto> returnEndangered(String path) throws IOException {

		String str = "";

		for (int i = 1; i <= 14; i++) {

			String url = "https://species.nibr.go.kr/endangeredspecies/rehome/exlist/exlist.jsp?1=1&1=1&search_key=all&search_yn=Y&sch_gbn=ex&chk_rcomm_group_all=Y&sch_rcomm_group0=MM&sch_rcomm_group1=AV&sch_rcomm_group2=RP&sch_rcomm_group3=AM&sch_rcomm_group4=-P&sch_rcomm_group5=IN&sch_rcomm_group6=IV&sch_rcomm_group7=VP&sch_rcomm_group8=AL&sch_rcomm_group9=FG&chk_ex_rl_all=Y&sch_ex1=Y&sch_ex2=Y&sch_sort=cls_kname&unit_count=20&sch_view_type=photo&page_count="
					+ i;
			String selector = ".wrapPost > div > a > img";
			Document doc = null;

			try {
				doc = Jsoup.connect(url).post(); // post방식으로 url을 연결하여 값을 가져와 doc에 담음.
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}

			Elements contents = doc.select(selector); // doc(HTML문서)에서 (selector)내용을 가져옴.

			for (Element element : contents) {
				if (element.attr("src").equals("")) {
						continue;
				} else {
					if (element.attr("src").startsWith("../../upload_data")) {
						str += element.attr("src").replaceAll("../../", "https://species.nibr.go.kr/endangeredspecies/")
								+ ",";
						str += element.attr("alt") + ",";
					} else {
						str += "https://species.nibr.go.kr" + element.attr("src") + ",";
					}
				}
			}
		}

		// 배열에 담기
		String[] endangered = str.split(",");
		
		// 객체 생성하여 dto에 set해준 후 dto를 list에 담기
		AnimalEndangeredSpeciesDto dto = new AnimalEndangeredSpeciesDto();
		List<AnimalEndangeredSpeciesDto> list = new ArrayList<AnimalEndangeredSpeciesDto>();

		for (int i = 0; i < endangered.length; i++) {
			if (i % 6 == 0) {
				dto.setGroups(endangered[i]);
			}
			if (i % 6 == 1) {
				dto.setGrade(endangered[i]);
			}
			if (i % 6 == 2) {
				dto.setKorName(endangered[i]);
			}
			if (i % 6 == 3) {
				dto.setEngName(endangered[i]);
			}
			if (i % 6 == 4) {
				dto.setKorRedList(endangered[i]);
			}
			if (i % 6 == 5) {
				dto.setEngRedList(endangered[i]);
				list.add(dto);
				dto = new AnimalEndangeredSpeciesDto();
			}
		}
		return list;
	}
	
	public List<List<String>> returnEndangeredCSV(String path) throws IOException {
		
		List<List<String>> list = new ArrayList<List<String>>();
		
		BufferedReader br = Files.newBufferedReader(Paths.get(path));
		
		String line = "";
		String array[] = null;
		while ((line = br.readLine()) != null) {
			List<String> temp = new ArrayList<String>();
			array = line.split(",");
			
//			temp = Arrays.asList(array);
//
//			list.add(temp);
 		}
//		br.close();
		System.out.println(array);
		return list;
	}
}
