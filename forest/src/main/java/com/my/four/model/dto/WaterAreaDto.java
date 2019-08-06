package com.my.four.model.dto;

public class WaterAreaDto {
	
	private int repyear;
	private String area;
	private int amount;
	
	
	public WaterAreaDto() {
		super();
	}


	public WaterAreaDto(int repyear, String area, int amount) {
		super();
		this.repyear = repyear;
		this.area = area;
		this.amount = amount;
	}


	public int getRepyear() {
		return repyear;
	}


	public void setRepyear(int repyear) {
		this.repyear = repyear;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
}
