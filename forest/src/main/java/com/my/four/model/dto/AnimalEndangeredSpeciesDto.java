package com.my.four.model.dto;

public class AnimalEndangeredSpeciesDto {

	private String img;
	private String name;
	private String grade;
	
	public AnimalEndangeredSpeciesDto() {
		
	}
	
	public AnimalEndangeredSpeciesDto(String img, String name, String grade) {
		this.img = img;
		this.name = name;
		this.grade = grade;
	}
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}
