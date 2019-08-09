package com.my.four.model.dto;

public class VolmemberDto {
	
	private String voltitle;
	private String volid;
	
	public String getVoltitle() {
		return voltitle;
	}
	public void setVoltitle(String voltitle) {
		this.voltitle = voltitle;
	}
	public String getVolid() {
		return volid;
	}
	public void setVolid(String volid) {
		this.volid = volid;
	}
	
	public VolmemberDto() {
		
	}
	
	public VolmemberDto(String voltitle, String volid) {
		super();
		this.voltitle = voltitle;
		this.volid = volid;
	}
	
}