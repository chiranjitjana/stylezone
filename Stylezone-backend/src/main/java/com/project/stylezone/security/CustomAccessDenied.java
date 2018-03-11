package com.project.stylezone.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

@Component("customAccessDeniedHandler")
public class CustomAccessDenied implements AccessDeniedHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			System.out.println("CustomAccessDenied.handle()"+" User: " + auth.getName() + " attempted to access the protected URL: " + request.getRequestURI());
			//LOG.warn("User: " + auth.getName() + " attempted to access the protected URL: " + request.getRequestURI());
		}

		redirectStrategy.sendRedirect(request, response, "/loginprocess?accessDenied");

	}

}
