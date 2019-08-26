package com.my.four.model.security;




import java.io.PrintWriter;
import java.nio.file.attribute.UserPrincipalNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.my.four.model.biz.LoginBiz;
import com.my.four.model.dto.LoginDto;

public class AuthenticationService implements UserDetailsService {
	@Autowired
	LoginBiz biz;
    

	public AuthenticationService() {
	}

	

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		System.out.println("id"+id);
		
			LoginDto dto = biz.login(id);
			
			System.out.println("11111111111111"+dto);
			if (dto == null) {
				throw new UsernameNotFoundException(id);
			}else {
				LoginDto dto1 = biz.memberInfo(id);
				if(dto1.getEnabledDb().equals("N")) {
					System.out.println("hi!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
					throw new DisabledException("이미 탈퇴된 회원입니다.");
				}else {
					if(dto1.getRoles().equals("ADMIN")) {
						return dto;
					}else {
						return dto;
					}
					
				}
					
			}
			
			
	}

}
