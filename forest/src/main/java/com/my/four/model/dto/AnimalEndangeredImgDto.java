package com.my.four.model.dto;

public class AnimalEndangeredImgDto {

	private String korName;
	private String img;
	
	public AnimalEndangeredImgDto() {

	}

	public AnimalEndangeredImgDto(String korName, String img) {
		this.korName = korName;
		this.img = img;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
