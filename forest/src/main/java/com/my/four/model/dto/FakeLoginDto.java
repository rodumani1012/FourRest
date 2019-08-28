package com.my.four.model.dto;

import java.util.Date;
import java.util.List;

public class FakeLoginDto {

	private int usernum;
	private String name;
	private String id;
	private String pw;
	private String phone;
	private String email;
	private String addr;
	private String zonecode;
	private String enabledDb;
	private Date joindate;
	private String perpay;
	private List<String> roles;
	
	
	public FakeLoginDto() {
		super();
	}


	public FakeLoginDto(int usernum, String name, String id, String pw, String phone, String email, String addr,
			String zonecode, String enabledDb, Date joindate, String perpay, List<String> roles) {
		super();
		this.usernum = usernum;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.zonecode = zonecode;
		this.enabledDb = enabledDb;
		this.joindate = joindate;
		this.perpay = perpay;
		this.roles = roles;
	}


	public int getUsernum() {
		return usernum;
	}


	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getZonecode() {
		return zonecode;
	}


	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}


	public String getEnabledDb() {
		return enabledDb;
	}


	public void setEnabledDb(String enabledDb) {
		this.enabledDb = enabledDb;
	}


	public Date getJoindate() {
		return joindate;
	}


	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	public String getPerpay() {
		return perpay;
	}


	public void setPerpay(String perpay) {
		this.perpay = perpay;
	}


	public List<String> getRoles() {
		return roles;
	}


	public void setRoles(List<String> roles) {
		this.roles = roles;
	}
	
	
	
	
}
