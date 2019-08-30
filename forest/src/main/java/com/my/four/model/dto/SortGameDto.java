package com.my.four.model.dto;

public class SortGameDto {

	private String userid;
	private int taketime;
	private int correctcnt;
	private int score;
	public SortGameDto() {
		super();
	}
	
	public SortGameDto(String userid, int taketime, int correctcnt, int score) {
		super();
		this.userid = userid;
		this.taketime = taketime;
		this.correctcnt = correctcnt;
		this.score = score;
	}
	//랭크보여주러갈때
	public SortGameDto(String userid, int taketime, int correctcnt) {
		super();
		this.userid = userid;
		this.taketime = taketime;
		this.correctcnt = correctcnt;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getTaketime() {
		return taketime;
	}
	public void setTaketime(int taketime) {
		this.taketime = taketime;
	}
	public int getCorrectcnt() {
		return correctcnt;
	}
	public void setCorrectcnt(int correctcnt) {
		this.correctcnt = correctcnt;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
	
}
