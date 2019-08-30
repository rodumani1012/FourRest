package com.my.four.model.dto;

public class SortRankDto {
	private int rn;
	private String userid;
	private int taketime;
	private int correctcnt;
	private int score;
	
	public SortRankDto() {
		super();
	}
	public SortRankDto(int rn, String userid, int taketime, int correctcnt, int score) {
		super();
		this.rn = rn;
		this.userid = userid;
		this.taketime = taketime;
		this.correctcnt = correctcnt;
		this.score = score;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
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
