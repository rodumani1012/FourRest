package com.my.four.pollution;

import java.io.IOException;
import java.util.Set;

import com.my.four.model.dto.TrashAreaDto;
import com.my.four.model.dto.WaterAreaDto;


public class PollutionData {
	

	TrashAreaDto trashDto = null;
	WaterAreaDto waterDto =null;

	public static void pull() throws IOException {
		
		
//	ClassPathResource cpr = new ClassPathResource("garbage.xlsx");	
//	System.out.println(cpr.getFile().getAbsolutePath());
	
//	
//	FileInputStream fis = new FileInputStream(cpr.getFile());
//	
//	XSSFWorkbook wb = new XSSFWorkbook(fis);
//	
//	XSSFSheet sh = wb.getSheetAt(0);
//	
//	XSSFCell cell = sh.getRow(0).getCell(0);
//	
//	String ty = cell.getCellType()+"";
//	
//	
	
	
	
	
//	ClassPathResource resource = new ClassPathResource("areadata/garbage.xlsx");	
//	System.out.println(resource.getPath());
//	System.out.println(resource.getURL());
//	System.out.println(resource.getURI());
//	System.out.println(resource.getInputStream());

	
//	Path path = Paths.get(resource.getURI());
//	List<String> content = Files.readAllLines(path);

	
//	XSSFWorkbook wb = new XSSFWorkbook(path);
//	
//	List<HashMap<String,Object>> listgb= new ArrayList<HashMap<String,Object>>();
//	
//	for(Row row:wb.getSheetAt(0)) {
//		if(row.getRowNum()==1)
//			continue;
//		HashMap<String,Object> hmgb = new HashMap<String,Object>();
//		hmgb.put("2011", new BigDecimal((row.getCell(2)).getNumericCellValue()));
//		
//		
//	}
//
//	
//	}
	}
		
public static void main(String[] args) throws IOException {
	pull();
}	
	
}
