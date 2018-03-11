package com.project.stylezone.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;


@Component("authenticationFailureHandler")
public class CustomAuthenticationFailure extends SimpleUrlAuthenticationFailureHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub

		String targetUrl = getTargetUrl(exception);
		redirectStrategy.sendRedirect(request, response, targetUrl);

	}

	private String getTargetUrl(AuthenticationException exception) {
		// TODO Auto-generated method stub
		if (exception.getClass().isAssignableFrom(UsernameNotFoundException.class)) {
			return "/loginprocess?error";
		} else if (exception.getClass().isAssignableFrom(DisabledException.class)) {
			return "/loginprocess?notApproved";
		} else if (exception.getClass().isAssignableFrom(SessionAuthenticationException.class)) {
			return "/loginprocess?duplicateSessionObject";
		} else {
			throw new IllegalStateException();
		}

	}

}
