package com.my.four.model.dto;

public class StarRecordDto {

	private int usernum;
	private int boardno;
	private int starrate;
	
	public StarRecordDto() {
		super();
	}
	
	public StarRecordDto(int usernum, int boardno, int starrate) {
		super();
		this.usernum = usernum;
		this.boardno = boardno;
		this.starrate = starrate;
	}
	
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getStarrate() {
		return starrate;
	}
	public void setStarrate(int starrate) {
		this.starrate = starrate;
	}
	
	
}
