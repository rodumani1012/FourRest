package com.my.four.model.dto;

import java.util.Date;

public class FreecommentDto {
	
	private int comm_seq;
	private int comm_freeseq;
	private String comm_id;
	private String comm_content;
	private Date comm_date;
	
	
	public int getComm_seq() {
		return comm_seq;
	}
	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}
	public int getComm_freeseq() {
		return comm_freeseq;
	}
	public void setComm_freeseq(int comm_freeseq) {
		this.comm_freeseq = comm_freeseq;
	}
	public String getComm_id() {
		return comm_id;
	}
	public void setComm_id(String comm_id) {
		this.comm_id = comm_id;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public Date getComm_date() {
		return comm_date;
	}
	public void setComm_date(Date comm_date) {
		this.comm_date = comm_date;
	}
	
	

}
