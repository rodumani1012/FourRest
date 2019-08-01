package com.my.four.model.dto;

import java.util.Date;

import javax.xml.crypto.Data;

public class ContestBoardDto {

	private int boardno;
	private int groupno;
	private int groupsq;
	private int replyno;
	private int likecnt;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	
	
	
	public ContestBoardDto() {
		super();
	}



	public ContestBoardDto(String writer, String title, String content) {
		super();
		Date today = new Date();
		this.boardno = 0;
		this.groupno = 0;
		this.groupsq = 0;
		this.replyno = 0;
		this.likecnt = 0;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate=today;
	}



	public ContestBoardDto(int boardno, int groupno, int groupsq, int replyno, int likecnt, String writer, String title,
			String content, Date regdate) {
		super();
		this.boardno = boardno;
		this.groupno = groupno;
		this.groupsq = groupsq;
		this.replyno = replyno;
		this.likecnt = likecnt;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}


	public int getBoardno() {
		return boardno;
	}



	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}



	public int getGroupno() {
		return groupno;
	}



	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}



	public int getGroupsq() {
		return groupsq;
	}



	public void setGroupsq(int groupsq) {
		this.groupsq = groupsq;
	}



	public int getReplyno() {
		return replyno;
	}



	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}



	public int getLikecnt() {
		return likecnt;
	}



	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
