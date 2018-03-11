package com.project.stylezone.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component("authenticationSuccessHandler")
public class CustomAuthenticationSuccess implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String email = authentication.getName();

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		List<String> roles = new ArrayList<String>();

		for (GrantedAuthority a : authorities) {
			roles.add(a.getAuthority());
		}

		String url = customRedirect(roles);

		/* System.out.println("emaail " + email + "  role" + url); */
		request.getSession().setAttribute("email", email);
		request.getSession().setMaxInactiveInterval(20 * 60);
		redirectStrategy.sendRedirect(request, response, url);
	}

	private String customRedirect(List<String> roles) {
		String targetUrl = null;
		if (roles.contains("ROLE_Admin")) {
			targetUrl = "/adminpanel";
			
		} else if (roles.contains("ROLE_Superadmin")) {
			targetUrl = "/superadminpanel";
		} else if (roles.contains("ROLE_User")) {
			targetUrl = "/index";
		}
		return targetUrl;
	}

}
