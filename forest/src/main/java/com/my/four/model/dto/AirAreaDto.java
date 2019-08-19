package com.my.four.model.dto;

public class AirAreaDto {

	private int repyear;
	private String area;
	private double amount;
	public AirAreaDto() {
		super();
	}
	public AirAreaDto(int repyear, String area, double amount) {
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
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	
	
}
