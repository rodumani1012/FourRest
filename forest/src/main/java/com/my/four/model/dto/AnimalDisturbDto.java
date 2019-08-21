package com.my.four.model.dto;

public class AnimalDisturbDto {

	private String kor_name;
	private String eng_name;
	private String groups;
	private String management;
	private String country;
	private String img;
	
	public AnimalDisturbDto() {
		
	}

	public AnimalDisturbDto(String kor_name, String eng_name, String groups, String management, String country, String img) {
		this.kor_name = kor_name;
		this.eng_name = eng_name;
		this.groups = groups;
		this.management = management;
		this.country = country;
		this.img = img;
	}

	public String getKor_name() {
		return kor_name;
	}

	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}

	public String getEng_name() {
		return eng_name;
	}

	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
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