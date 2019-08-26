package com.my.four.model.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.bridge.MessageUtil;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler{
	
	private String id;
	private String password;
	private String errormsg;
	private String defaultFailureUrl;
	
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getErrormsg() {
		return errormsg;
	}



	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}



	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}



	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}



	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String userid = request.getParameter(id);
		System.out.println(userid);
		String userpw = request.getParameter(password);
		System.out.println(userpw);
		String error =exception.getMessage();
		System.out.println(error);
		
		
		
		
	      request.setAttribute(id, userid);
	      request.setAttribute(password, userpw);
	      request.setAttribute(errormsg, error);      
	      request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
	}

}
	