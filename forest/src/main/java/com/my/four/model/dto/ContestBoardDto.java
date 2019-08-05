package com.my.four.model.dto;

import java.util.Date;

import javax.xml.crypto.Data;

public class ContestBoardDto {
	private int conlistno;
	private int boardno;
	private int groupno;
	private int groupsq;
	private int replyno;
	private double likerate;
	private int likecnt;
	private String writer;
	private String title;
	private String reppic;
	private String content;
	private Date regdate;
	
	public ContestBoardDto() {
		super();
	}
	public ContestBoardDto(int conlistno) {
		this.conlistno = conlistno;
	}
	//별점업댓시
	public ContestBoardDto(int boardno,double likerate) {
		this.boardno=boardno;
		this.likerate=likerate;
	}
	
	//게시글작성할때
	public ContestBoardDto(int conlistno, String writer, String title, String content) {
		super();
		this.conlistno = conlistno;
		this.writer = writer;
		this.title = title;
		this.content = content;
	}


	public ContestBoardDto(int conlistno, int boardno, int groupno, int groupsq, int replyno, double likerate,
			int likecnt, String writer, String title, String reppic, String content, Date regdate) {
		super();
		this.conlistno = conlistno;
		this.boardno = boardno;
		this.groupno = groupno;
		this.groupsq = groupsq;
		this.replyno = replyno;
		this.likerate = likerate;
		this.likecnt = likecnt;
		this.writer = writer;
		this.title = title;
		this.reppic = reppic;
		this.content = content;
		this.regdate = regdate;
	}

	public int getConlistno() {
		return conlistno;
	}

	public void setConlistno(int conlistno) {
		this.conlistno = conlistno;
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

	public double getLikerate() {
		return likerate;
	}

	public void setLikerate(double likerate) {
		this.likerate = likerate;
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

	public String getReppic() {
		return reppic;
	}

	public void setReppic(String reppic) {
		this.reppic = reppic;
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
