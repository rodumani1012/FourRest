package com.my.four.model.dto;

public class AnimalDisturbDto {

	private String korName;
	private String engName;
	private String groups;
	private String management;
	private String country;
	private String img;
	
	public AnimalDisturbDto() {
		
	}

	public AnimalDisturbDto(String korName, String engName, String groups, String management, String country, String img) {
		this.korName = korName;
		this.engName = engName;
		this.groups = groups;
		this.management = management;
		this.country = country;
		this.img = img;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getGroups() {
		return groups;
	}

	public void setGroups(String groups) {
		this.groups = groups;
	}

	public String getManagement() {
		return management;
	}

	public void setManagement(String management) {
		this.management = management;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}