package com.my.four.model.dto;

import java.util.Date;

public class ContestListDto {
	private int boardno;
	private String title;
	private String reppic;
	private String content;
	private String forwho;
	private String prize;
	private Date startdate;
	private Date enddate;
	private int partnum;
	private String sort;
	private Date regdate;
	
	public ContestListDto() {
		super();
	}

	
	//관리자 공모글 등록할때
	public ContestListDto(String title, String content, String forwho, 
			String prize, Date startdate, Date enddate,
			String sort) {
		super();
		this.title = title;
		this.content = content;
		this.forwho = forwho;
		this.prize = prize;
		this.startdate = startdate;
		this.enddate = enddate;
		this.sort = sort;
	}



	public ContestListDto(int boardno, String title, String reppic, String content, String forwho, String prize,
			Date startdate, Date enddate, int partnum, String sort, Date regdate) {
		super();
		this.boardno = boardno;
		this.title = title;
		this.reppic = reppic;
		this.content = content;
		this.forwho = forwho;
		this.prize = prize;
		this.startdate = startdate;
		this.enddate = enddate;
		this.partnum = partnum;
		this.sort = sort;
		this.regdate = regdate;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
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

	public String getForwho() {
		return forwho;
	}

	public void setForwho(String forwho) {
		this.forwho = forwho;
	}

	public String getPrize() {
		return prize;
	}

	public void setPrize(String prize) {
		this.prize = prize;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getPartnum() {
		return partnum;
	}

	public void setPartnum(int partnum) {
		this.partnum = partnum;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
