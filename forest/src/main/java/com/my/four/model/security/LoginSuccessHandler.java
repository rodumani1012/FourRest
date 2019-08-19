package com.my.four.model.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.my.four.model.dto.LoginDto;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
			LoginDto dto = (LoginDto)authentication.getPrincipal();
			System.out.println(dto);
			String msg = authentication.getName()+"님 환영합니다";
			request.setAttribute("msg", msg);
			RequestDispatcher rd =request.getRequestDispatcher("/");
			rd.forward(request, response);
	}

}
