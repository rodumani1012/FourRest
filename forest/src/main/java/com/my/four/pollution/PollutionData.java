package com.my.four.pollution;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.my.four.model.dto.AreaDto;

public class PollutionData {

	public List<AreaDto> returnTrashdata(String path) throws IOException {

		BufferedReader br;

		br = Files.newBufferedReader(Paths.get(path), Charset.defaultCharset());
		String line = "";
		List<AreaDto> list = new ArrayList<AreaDto>();
		br.readLine();
		br.readLine();
		while ((line = br.readLine()) != null) {
			System.out.println(line);
			String[] arr = line.split(",");
			int year = 2011;
			for (int i = 1; i < arr.length; i++) {
				AreaDto dto = new AreaDto();
				dto.setArea(arr[0]);
				dto.setRepyear(year);
				if(arr[i].equals("NaN"))
					dto.setAmount(0.0);
				else 
					dto.setAmount(Double.parseDouble(arr[i]));
				list.add(dto);
				year++;
			}
		}
		return list;
	}
	
	
	public List<AreaDto> returnairdata(String path) throws IOException {

		BufferedReader br;

		br = Files.newBufferedReader(Paths.get(path), Charset.defaultCharset());
		String line = "";
		List<AreaDto> list = new ArrayList<AreaDto>();
		br.readLine();
		br.readLine();
		while ((line = br.readLine()) != null) {
			System.out.println(line);
			String[] arr = line.split(",");
			AreaDto dto = new AreaDto();
			dto.setRepyear(Integer.parseInt(arr[0].substring(0, 4)));
			if(arr[1].equals("충청북도"))
				dto.setArea("충북");
			else if(arr[1].equals("충청남도"))
				dto.setArea("충남");
			else if(arr[1].equals("전라북도"))
				dto.setArea("전북");
			else if(arr[1].equals("전라남도"))
				dto.setArea("전남");
			else if(arr[1].equals("경상북도"))
				dto.setArea("경북");
			else if(arr[1].equals("경상남도"))
				dto.setArea("경남");
			else if(arr[1].equals("전국"))
				continue;
			else {
				dto.setArea(arr[1].substring(0, 2));				
			}
			dto.setAmount(Double.parseDouble(arr[2]));
			list.add(dto);
		}
		return list;
	}
	
	public void mapjsonreturn(String path) throws FileNotFoundException, IOException, ParseException {
		
		JSONParser parser = new JSONParser();
		
		String str=Paths.get(path)+"";
		Object obj = parser.parse(new FileReader(str));
		
		JSONObject jsonObj =(JSONObject) obj;
		
		String area_kor = (String)jsonObj.get("properties");
		
		
		
	}
	
	

}
