package com.project.stylezone.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Users;
import com.project.stylezone.service.AuthenticationVerifier;

@Component("authenticationProvider")
public class CustomAuthenicationProvider implements AuthenticationProvider {

	@Autowired
	AuthenticationVerifier authVerifier;

	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		String userName = authentication.getName();
		String password = authentication.getCredentials().toString();
		
		System.out.println("Username "+userName+" password"+password);
		
		Users user = authVerifier.fetchUserByEmailAndPassword(userName, password);

		if (user != null) {
			System.out.println(user.toString());
			
			List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
			grantedAuths.add(new SimpleGrantedAuthority("ROLE_" + user.getUserRole().getRoleName()));
			return new UsernamePasswordAuthenticationToken(userName, password, grantedAuths);
		}
		else {
			
			throw new UsernameNotFoundException("User Not Found");
        }
	}

	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
