package com.my.four.crawling;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.my.four.model.biz.AnimalListBiz;
import com.my.four.model.dto.AnimalDisturbDto;
import com.my.four.model.dto.AnimalEndangeredCSVDto;
import com.my.four.model.dto.AnimalEndangeredImgDto;
import com.my.four.model.dto.AnimalHarmDto;
import com.my.four.model.dto.AnimalShelterListDto;

@Component
public class AnimalList {
	
	@Autowired
	AnimalListBiz biz;
	
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
	
	// 멸종위기 이미지 src와 alt를 list로 돌려주는 메소드
	public List<AnimalEndangeredImgDto> returnEndangeredImg() throws IOException {

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
						str += element.attr("alt") + ",";
					}
				}
			}
		}

		// 배열에 담기
		String[] endangered = str.split(",");
		
		// 객체 생성하여 dto에 set해준 후 dto를 list에 담기
		AnimalEndangeredImgDto dto = new AnimalEndangeredImgDto();
		List<AnimalEndangeredImgDto> list = new ArrayList<AnimalEndangeredImgDto>();

		for (int i = 0; i < endangered.length; i++) {
			if (i % 2 == 0) {
				dto.setImg(endangered[i]);
			}
			if (i % 2 == 1) {
				dto.setKorName(endangered[i]);
				list.add(dto);
				dto = new AnimalEndangeredImgDto();
			}
		}
		return list;
	}
	
	// 멸종위기 CSV 파일 리스트 돌려주는 메소드
	public List<AnimalEndangeredCSVDto> returnEndangeredCSV(String path) throws IOException {
		
		BufferedReader br = Files.newBufferedReader(Paths.get(path));
		
		List<String> line = new ArrayList<String>();
		
		String str = "";
		String array[] = null;
 		while ((str = br.readLine()) != null) {
			 array = str.split(",");
			 
			 line.addAll(Arrays.asList(array));
 		}
		br.close();
		
		AnimalEndangeredCSVDto dto = new AnimalEndangeredCSVDto();
		List<AnimalEndangeredCSVDto> list = new ArrayList<AnimalEndangeredCSVDto>();
		
		for (int i = 0; i < line.size(); i++) {
			if(i%6 == 0) {
				dto.setGroups(line.get(i));
			}
			if(i%6 == 1) {
				dto.setGrade(line.get(i));
			}
			if(i%6 == 2) {
				dto.setKorName(line.get(i));
			}
			if(i%6 == 3) {
				dto.setEngName(line.get(i));
			}
			if(i%6 == 4) {
				dto.setKorRedList(line.get(i));
			}
			if(i%6 == 5) {
				dto.setEngRedList(line.get(i));
				list.add(dto);
				dto = new AnimalEndangeredCSVDto();
			}
		}
		return list;
	}
	
	// 멸종위기 페이지의 테이블 값을 돌려주는 메소드
	public String[] returnTable() {
		
		List<String> grade = new ArrayList<String>();
		grade.add("I");
		grade.add("II");
		
		List<String> groups = new ArrayList<String>();
		groups.add("포유류");
		groups.add("조류");		
		groups.add("파충류");
		groups.add("양서류");
		groups.add("어류");
		groups.add("곤충류");
		groups.add("무척추동물");
		groups.add("육상식물");
		groups.add("해초류");
		groups.add("고등균류");
		
		List<List<String>> list = new ArrayList<List<String>>();
		list.add(grade);
		list.add(groups);
		
		
		String str = "";
		
		for (int i = 0; i < list.size(); i++) {
			for(int j = 0; j < list.get(1).size(); j++) {
				str += biz.aniGetOne(list.get(0).get(i), list.get(1).get(j)) + "#";
			}
		}
		
		String array[] = str.split("#");
		
		return array;
	}
	
	// 멸종위기 페이지의 테이블 총계값을 돌려주는 메소드
	public int[] returnTotal() {
		
		String array[] = returnTable();
		int res[] = new int[11];
		int total = 0;
		
		for(int i = 0; i < 10; i++) {
			res[i] = Integer.parseInt(array[i]) + Integer.parseInt(array[i+10]);
			total += Integer.parseInt(array[i]) + Integer.parseInt(array[i+10]);
		}
		res[10] = total;
		
		return res;
	}

	// 생태계 교란종 list를 돌려주는 메소드
	public List<AnimalDisturbDto> returnDisturb() throws IOException {

		// 객체 생성하여 dto에 set해준 후 dto를 list에 담기
		AnimalDisturbDto dto = new AnimalDisturbDto();
		List<AnimalDisturbDto> list = new ArrayList<AnimalDisturbDto>();
		
		for (int i = 1; i <= 3; i++) {
			
			String url = "http://kias.nie.re.kr/home/for/for02001l.do?1=1&1=1&searchClsGbn=eco&searchYn=Y&pageIndex="+i+"#sres";
			String selector = ".thumwrap > ul > li, em > li";
			Document doc = null;

			try {
				doc = Jsoup.connect(url).post(); // post방식으로 url을 연결하여 값을 가져와 doc에 담음.
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}

			Elements contents = doc.select(selector); // doc(HTML문서)에서 (selector)내용을 가져옴.

			for (Element element : contents) {
				dto.setImg("http://kias.nie.re.kr" + element.getElementsByTag("img").attr("src"));
				dto.setKor_name(element.text().substring(0, element.text().indexOf("영명")).trim());
				dto.setEng_name(element.text().substring(element.text().indexOf("영명")+5, element.text().indexOf("분류군")).trim());
				dto.setGroups(element.text().substring(element.text().indexOf("분류군")+5, element.text().indexOf("관리현황")).trim());
				if(element.text().contains("원산지")) {
					dto.setManagement(element.text().substring(element.text().indexOf("관리현황")+6, element.text().indexOf("원산지")).trim());
					dto.setCountry(element.text().substring(element.text().indexOf("원산지")+5).trim());
				} else {
					dto.setManagement(element.text().substring(element.text().indexOf("관리현황")+6).trim());
					dto.setCountry("NA");
				}
				list.add(dto);
				dto = new AnimalDisturbDto();
			}
		}
		return list;
	}
	
	// 위해 우려종 list를 돌려주는 메소드
	public List<AnimalHarmDto> returnHarm() throws IOException {
		
		List<AnimalHarmDto> list = new ArrayList<AnimalHarmDto>();
		
		String category[] = {"MM", "AV", "RP", "AM", "-P", "IN", "IV", "VP"};
		
		for(int i = 0; i < category.length; i++) {
			switch (category[i]) {
			case "MM":
				list.addAll(categoryList(category[i], "포유류", 1));
				break;
			case "AV":
				list.addAll(categoryList(category[i], "조류", 1));
				break;
			case "RP":
				list.addAll(categoryList(category[i], "파충류", 1));
				break;
			case "AM":
				list.addAll(categoryList(category[i], "양서류", 1));
				break;
			case "-P":
				list.addAll(categoryList(category[i], "어류", 5));
				break;
			case "IN":
				list.addAll(categoryList(category[i], "곤충", 1));
				break;
			case "IV":
				list.addAll(categoryList(category[i], "무척추동물", 1));
				break;
			case "VP":
				list.addAll(categoryList(category[i], "식물", 5));
				break;
			}
		}
		return list;
	}
	
	// 카테고리별 목록 리턴
	public static List<AnimalHarmDto> categoryList(String category, String kor_category, int count) {

		// 객체 생성하여 dto에 set해준 후 dto를 list에 담기
		AnimalHarmDto dto = new AnimalHarmDto();
		List<AnimalHarmDto> list = new ArrayList<AnimalHarmDto>();
		
		for(int i = 1; i <= count; i++) {

			String url = "http://kias.nie.re.kr/home/ham/ham02001l.do?1=1&commGroupList="+category+",&enltime=&origin=&r500Knm=&searchClsGbn=harm&searchKey=cls_nm&searchKeyword=&searchKeywordList=&searchYn=Y&pageIndex="+i+"#sres";
			String selector = ".thumwrap > ul > li, em > li";
			Document doc = null;

			try {
				doc = Jsoup.connect(url).post(); // post방식으로 url을 연결하여 값을 가져와 doc에 담음.
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}

			Elements contents = doc.select(selector); // doc(HTML문서)에서 (selector)내용을 가져옴.

			for (Element element : contents) {
				if (element.getElementsByTag("img").attr("src").length() < 1) {
					dto.setImg("http://kias.nie.re.kr/home/images/common/noimg169_127.gif");
				} else {
					dto.setImg("http://kias.nie.re.kr" + element.getElementsByTag("img").attr("src"));
				}
				dto.setKor_name(element.text().substring(0, element.text().indexOf("영명")).trim());
				if(element.text().substring(element.text().indexOf("영명")+5, element.text().indexOf("분류군")).trim().length() < 1) {
					dto.setEng_name("NA");
				} else {
					dto.setEng_name(element.text().substring(element.text().indexOf("영명")+5, element.text().indexOf("분류군")).trim());
				}
				dto.setGroups(kor_category);
				if(element.text().substring(element.text().indexOf("관리현황")+6).trim().contains("사진 더보기")) {
					dto.setManagement(element.text().substring(element.text().indexOf("관리현황")+6, element.text().indexOf("사진")).trim());
				} else {
					dto.setManagement(element.text().substring(element.text().indexOf("관리현황")+6).trim());
				}
				list.add(dto);
				dto = new AnimalHarmDto();
			}
		}
		return list;
	}
	
}
