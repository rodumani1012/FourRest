package com.my.four.model.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class LoginDto implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
	private String role;
	private List<String> roles;
	private Collection<? extends GrantedAuthority> authorities;

	public LoginDto() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<SimpleGrantedAuthority> grants = new ArrayList<SimpleGrantedAuthority>();
		grants.add(new SimpleGrantedAuthority(role));
         
		return grants;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return pw;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	//관리자 회원정보수정
	public LoginDto(int usernum, String phone, String email, String addr) {
		super();
		this.usernum = usernum;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
	}

	public LoginDto(int usernum, String name, String id, String pw, String phone, String email, String addr,
			String zonecode, String enabledDb, Date joindate,String perpay,String role, List<String> roles) {
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
		this.roles = roles;
		this.joindate=joindate;
		this.perpay=perpay;
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
	

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public void setEnabledDb(String enabledDb) {
		this.enabledDb = enabledDb;
	}

	public List<String> getRoles() {
		return roles;
	}
	

	public String getPerpay() {
		return perpay;
	}

	public void setPerpay(String perpay) {
		this.perpay = perpay;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	

}
