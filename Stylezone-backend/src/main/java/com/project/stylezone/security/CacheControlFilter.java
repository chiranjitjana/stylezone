package com.project.stylezone.security;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CacheControlFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletResponse resp = (HttpServletResponse) response;
		resp.setHeader("Expires", "Tue, 03 Jul 2001 06:00:00 GMT");
		resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0");
		resp.setHeader("Pragma", "no-cache");

		if (((HttpServletRequest) request).getSession(false) != null) {
			String sessionId = ((HttpServletRequest) request).getSession().getId();
			((HttpServletResponse) response).setHeader("SET-COOKIE", "JSESSIONID=" + sessionId + "; HttpOnly");
		}
		 chain.doFilter(request, response);

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
