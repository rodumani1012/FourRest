package com.my.four.model.dto;

import java.sql.Date;

public class FundingDto {
	
	private int fun_seq;
	private String fun_id;
	private String funtitle;
	private int goalmoney;
	private int nowmoney;
	private Date fundate;
	private int participants;
	private String fun_content;
	private String notice;
	
	public int getFun_seq() {
		return fun_seq;
	}
	public void setFun_seq(int fun_seq) {
		this.fun_seq = fun_seq;
	}
	public String getFun_id() {
		return fun_id;
	}
	public void setFun_id(String fun_id) {
		this.fun_id = fun_id;
	}
	public String getFuntitle() {
		return funtitle;
	}
	public void setFuntitle(String funtitle) {
		this.funtitle = funtitle;
	}
	public int getGoalmoney() {
		return goalmoney;
	}
	public void setGoalmoney(int goalmoney) {
		this.goalmoney = goalmoney;
	}
	public int getNowmoney() {
		return nowmoney;
	}
	public void setNowmoney(int nowmoney) {
		this.nowmoney = nowmoney;
	}
	public Date getFundate() {
		return fundate;
	}
	public void setFundate(Date fundate) {
		this.fundate = fundate;
	}
	public int getParticipants() {
		return participants;
	}
	public void setParticipants(int participants) {
		this.participants = participants;
	}
	public String getFun_content() {
		return fun_content;
	}
	public void setFun_content(String fun_content) {
		this.fun_content = fun_content;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	public FundingDto() {
		
	}
	
	public FundingDto(int fun_seq, String funtitle, int goalmoney, int nowmoney, Date fundate, int participants,
			String fun_content) {
		super();
		this.fun_seq = fun_seq;
		this.funtitle = funtitle;
		this.goalmoney = goalmoney;
		this.nowmoney = nowmoney;
		this.fundate = fundate;
		this.participants = participants;
		this.fun_content = fun_content;
	}
	
	public FundingDto(int fun_seq, String funtitle, int goalmoney, int nowmoney, Date fundate, int participants,
			String fun_content, String notice) {
		super();
		this.fun_seq = fun_seq;
		this.funtitle = funtitle;
		this.goalmoney = goalmoney;
		this.nowmoney = nowmoney;
		this.fundate = fundate;
		this.participants = participants;
		this.fun_content = fun_content;
		this.notice = notice;
	}
	
	@Override
	public String toString() {
		return "FundingDto [fun_seq=" + fun_seq + ", funtitle=" + funtitle + ", goalmoney=" + goalmoney + ", nowmoney="
				+ nowmoney + ", fundate=" + fundate + ", participants=" + participants + ", fun_content=" + fun_content
				+ ", notice=" + notice + "]";
	}

	
	
}
