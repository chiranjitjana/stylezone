package com.project.stylezone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UIController {

	@RequestMapping(value="/index")
	public String getHome() {
		return "/userpanel/index";
	}
	
	@RequestMapping(value="/userlogin")
	public String getUserLogin() {
		return "/userpanel/login";
	}
	
	@RequestMapping(value="/adminpanel")
	public String getAdminLoginPage() {
		return "/adminpanel/dashboard";
	}
	
	@RequestMapping(value="/cart")
	public String getCart() {
		return "/userpanel/cart";
	}
	
	
	@RequestMapping(value = "/logout")
	public String LogOut(HttpServletRequest request,HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    
	    }
	    return "redirect:/userlogin";
	}
	
}
