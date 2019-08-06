package com.my.four.model.dto;

public class AnimalEndangeredCSVDto {
	
	private String groups;
	private String grade;
	private String korName;
	private String engName;
	private String korRedList;
	private String engRedList;
	
	public AnimalEndangeredCSVDto() {
	
	}

	public AnimalEndangeredCSVDto(String groups, String grade, String korName, String engName, String korRedList,
			String engRedList) {
		this.groups = groups;
		this.grade = grade;
		this.korName = korName;
		this.engName = engName;
		this.korRedList = korRedList;
		this.engRedList = engRedList;
	}

	public String getGroups() {
		return groups;
	}

	public void setGroups(String groups) {
		this.groups = groups;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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

	public String getKorRedList() {
		return korRedList;
	}

	public void setKorRedList(String korRedList) {
		this.korRedList = korRedList;
	}

	public String getEngRedList() {
		return engRedList;
	}

	public void setEngRedList(String engRedList) {
		this.engRedList = engRedList;
	}

}
