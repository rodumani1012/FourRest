package com.my.four;

import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PollutionController {
	
	@RequestMapping("pollute")
	public String pollutedata(HttpServletRequest request) throws MalformedURLException {
		URL pathSet = request.getSession().getServletContext().getResource("/");
		System.out.println(pathSet);
		
		return "";
	}
	

}
