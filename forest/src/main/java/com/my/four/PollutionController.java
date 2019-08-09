package com.my.four;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonParser;
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
		return "pollution/polumap";
	}
	
	
	@RequestMapping("godomap.do")
	public String map() {
		
		return "pollution/test";
	}
	
	@RequestMapping("maptest.do")
	@ResponseBody
	public String jsonmap(@RequestParam("obj")String obj) {
		JsonParser parser = new JsonParser();
//		JsonElement element = parser.parse(obj);
//		if(element!=null)
//			return"들어왔따";
//		return "안왔는디?";
//	
		
		return "안왔는디 ";
	}
	
	@RequestMapping("mapmapjson.do")
	public void mapjson(Model model, HttpServletRequest request) {
		PollutionData polu = new PollutionData();
		//polu.returnTrashdata(request.getSession().getServletContext().getRealPath("resources/assets/csv/csvgarbage.csv"));

		
	}
	
	
	

}
