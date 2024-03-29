package com.my.four.model.dto;

import java.sql.Date;

public class CalendarDto {
	
	private int calnum;
	private String caltitle;
	private String calid;
	private Date calrecdate;
	private Date calrecdateend;
	private Date calvolundate;
	private Date calvolundateend;
	private String calcontent;
	private int calrecpeo;
	private int calnowpeo;
	private String notice;
	
	
	public int getCalnum() {
		return calnum;
	}
	public void setCalnum(int calnum) {
		this.calnum = calnum;
	}
	public String getCaltitle() {
		return caltitle;
	}
	public void setCaltitle(String caltitle) {
		this.caltitle = caltitle;
	}
	public String getCalid() {
		return calid;
	}
	public void setCalid(String calid) {
		this.calid = calid;
	}
	public Date getCalrecdate() {
		return calrecdate;
	}
	public void setCalrecdate(Date calrecdate) {
		this.calrecdate = calrecdate;
	}
	public Date getCalvolundate() {
		return calvolundate;
	}
	public void setCalvolundate(Date calvolundate) {
		this.calvolundate = calvolundate;
	}
	public String getCalcontent() {
		return calcontent;
	}
	public void setCalcontent(String calcontent) {
		this.calcontent = calcontent;
	}
	public int getCalrecpeo() {
		return calrecpeo;
	}
	public void setCalrecpeo(int calrecpeo) {
		this.calrecpeo = calrecpeo;
	}
	public int getCalnowpeo() {
		return calnowpeo;
	}
	public void setCalnowpeo(int calnowpeo) {
		this.calnowpeo = calnowpeo;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Date getCalrecdateend() {
		return calrecdateend;
	}
	public void setCalrecdateend(Date calrecdateend) {
		this.calrecdateend = calrecdateend;
	}
	public Date getCalvolundateend() {
		return calvolundateend;
	}
	public void setCalvolundateend(Date calvolundateend) {
		this.calvolundateend = calvolundateend;
	}
	
	public CalendarDto() {
		
	}
	
	public CalendarDto(int calnum, String caltitle, String calid, Date calrecdate, Date calrecdateend, Date calvolundate, Date calvolundateend, String calcontent,
			int calrecpeo, int calnowpeo, String notice) {
		super();
		this.calnum = calnum;
		this.caltitle = caltitle;
		this.calid = calid;
		this.calrecdate = calrecdate;
		this.calrecdateend = calrecdateend;
		this.calvolundate = calvolundate;
		this.calvolundateend = calvolundateend;
		this.calcontent = calcontent;
		this.calrecpeo = calrecpeo;
		this.calnowpeo = calnowpeo;
		this.notice = notice;
	}
}






