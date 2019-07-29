package com.my.four.model.dto;

public class AnimalShelterListDto {

	private String area;
	private String centerName;
	private String phoneNumber;
	private String centerAddr;
	
	public AnimalShelterListDto() {
		
	}

	public AnimalShelterListDto(String area, String centerName, String phoneNumber, String centerAddr) {
		this.area = area;
		this.centerName = centerName;
		this.phoneNumber = phoneNumber;
		this.centerAddr = centerAddr;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCenterAddr() {
		return centerAddr;
	}

	public void setCenterAddr(String centerAddr) {
		this.centerAddr = centerAddr;
	}
	
}
