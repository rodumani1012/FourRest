package com.my.four;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.four.model.biz.PollutionDataBiz;
import com.my.four.model.dto.AreaDto;
import com.my.four.pollution.PollutionData;

@Controller
public class PollutionController {
	
	private static final Logger logger = LoggerFactory.getLogger(PollutionController.class);
	
	@Autowired
	private PollutionDataBiz biz;
	
	@RequestMapping("polu.do")
	public String polution(Model model, HttpServletRequest request) throws IOException {
		logger.info("<<polu정보담으러왔니>>");

		int resultcnt=0;
		PollutionData polu = new PollutionData();
		List<AreaDto> trashlist =polu.returnTrashdata(request.getSession().getServletContext().getRealPath("resources/assets/csv/csvgarbage.csv"));
		System.out.println("polu"+trashlist.size());
		int res1 =0;
		res1 = biz.inserttrash(trashlist);
		if(res1>0) {
			System.out.println("쓰레기성공!");
			resultcnt++;
		}else{
			System.out.println("쓰레기실패 ..");
		}

		
		List<AreaDto> waterlist =polu.returnTrashdata(request.getSession().getServletContext().getRealPath("resources/assets/csv/csvwater.csv"));
		System.out.println("poluw"+waterlist.size());
		int res2 =0;
		res2 = biz.insertwater(waterlist);
		if(res2>0) {
			System.out.println("물성공!");
			resultcnt++;
		}else{
			System.out.println("물실패 ..");
		}
		
		List<AreaDto> airlist = polu.returnairdata(request.getSession().getServletContext().getRealPath("resources/assets/csv/csvair.csv"));
		System.out.println("poluw"+airlist.size());
		int res3 =0;
		res3 = biz.insertair(airlist);
		if(res3>0) {
			resultcnt++;
			System.out.println("공기성공!");
		
		}else{
			System.out.println("공기실패 ..");
		}
		
		if(resultcnt>=3)
			System.out.println("셋다성공");
		else
			System.out.println("안댐");
	
		return "admin/admin";
	}
	
	
	@RequestMapping("gotomap.do")
	public String map() {
		
		return "pollution/pollumap";
	}
	
	@RequestMapping("polu_showme.do")
	@ResponseBody
	public Map<String,Object> mapyear(@RequestParam("bigOption")String bigOption,String miniOption) {
		System.out.println("들어았니?");
		
		System.out.println(bigOption+"//"+miniOption);
		List<AreaDto> biglist = null;
		biglist = biz.selectBigList(Integer.parseInt(bigOption),Integer.parseInt(miniOption));
		Map<String,Object> bigmap = new HashMap<String,Object>();
		bigmap.put("biglist", biglist);
		if(Integer.parseInt(bigOption)==0) {
			System.out.println("???????머야");
			bigmap.put("bigtitle","지정폐기물 발생량");
			bigmap.put("bigyaxis", "(단위 : 톤/일)");
		}else if(Integer.parseInt(bigOption)==1) {
			bigmap.put("bigtitle","폐수발생량");
			bigmap.put("bigyaxis", "(단위 : m³/일)");
		}else if(Integer.parseInt(bigOption)==2) {
			bigmap.put("bigtitle","미세먼지(PM10) 배출량");
			bigmap.put("bigyaxis", "(단위 : kg )");

		}
		if(biglist.size()>=2) {
			bigmap.put("code", "OK");
			System.out.println(biglist.size());
			return bigmap;
		}
		else {
			bigmap.put("code", "NO");
			System.out.println("값안들어옴");
			return bigmap;
		}
	}
	
	@RequestMapping("polu_showarea.do")
	@ResponseBody
	public Map<String,Object> areayears(@RequestParam("bigOption")String bigOption,String areaname){
		List<AreaDto> minilist = null;
		
		minilist = biz.selectMiniList(Integer.parseInt(bigOption), areaname);
		Map<String,Object> minimap = new HashMap<String,Object>();
		minimap.put("minilist", minilist);
		if(minilist.size()!=0) {
			minimap.put("code", "OK");
		}else {
			minimap.put("code", "NO");
		}
		
		return minimap;
	}
	
	@RequestMapping("sortinggame.do")
	public String sortinggame() {
		return "pollution/sortinggame";
	}
	

	
	

}
