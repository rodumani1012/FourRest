package com.my.four.model.dto;

public class FundingLoadDto {
	
	private String id;
	private String funtitle;
	private int funmoney;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFuntitle() {
		return funtitle;
	}
	public void setFuntitle(String funtitle) {
		this.funtitle = funtitle;
	}
	public int getFunmoney() {
		return funmoney;
	}
	public void setFunmoney(int funmoney) {
		this.funmoney = funmoney;
	}
	
	public FundingLoadDto(String id, String funtitle, int funmoney) {
		
		this.id = id;
		this.funtitle = funtitle;
		this.funmoney = funmoney;
	}
	
	public FundingLoadDto() {
		
	}
	
	

}
