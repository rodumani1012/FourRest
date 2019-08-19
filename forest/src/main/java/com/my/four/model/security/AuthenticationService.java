package com.my.four.model.security;




import org.springframework.beans.factory.annotation.Autowired;
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
		System.out.println("------------------------"+id);
		
		System.out.println(biz);
		
		
		LoginDto dto = biz.login(id);
		
		
		if (dto == null) {
			throw new UsernameNotFoundException(id);
		}
		return dto; 
	}

}
