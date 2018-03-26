package com.project.stylezone.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Users;
import com.project.stylezone.service.AuthenticationVerifier;
import com.project.stylezone.service.UserService;

@Component("authenticationSuccessHandler")
public class CustomAuthenticationSuccess implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Autowired
	UserService userService;

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String email = authentication.getName();

		
		Users user = userService.findUserByUserEmail(email);
		String url=null;
		if(user.getAccStatus()==0)
		{
			url="/loginprocess?accountnotactivate";
		}
		else
		{
			Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

			List<String> roles = new ArrayList<String>();

			for (GrantedAuthority a : authorities) {
				roles.add(a.getAuthority());
			}

			url = customRedirect(roles,request);

			request.getSession().setAttribute("email", email);
			request.getSession().setAttribute("user_name", user.getUserName());
			
			request.getSession().setMaxInactiveInterval(20 * 60);
		}
		
		
		
		
	
		redirectStrategy.sendRedirect(request, response, url);
	}

	private String customRedirect(List<String> roles,HttpServletRequest request) {
		String targetUrl = null;
		
	
		
		if (roles.contains("ROLE_Admin")) {
			targetUrl = "/adminpanel";
			request.getSession().setAttribute("role", "ROLE_Admin");
		} else if (roles.contains("ROLE_Superadmin")) {
			targetUrl = "/superadminpanel";
			request.getSession().setAttribute("role", "ROLE_Superadmin");
		} else if (roles.contains("ROLE_User")) {
			targetUrl = "/index";
			request.getSession().setAttribute("role", "ROLE_User");
		}
		return targetUrl;
	}

}
