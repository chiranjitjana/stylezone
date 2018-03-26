package com.project.stylezone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.stylezone.AppConstant;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;
import com.project.stylezone.service.UserService;



@Controller
public class UIController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/index")
	public String getHome() {
		return "/userpanel/index";
	}

	@RequestMapping(value = "/userlogin")
	public String getUserLogin() {
		return "/userpanel/login";
	}

	@RequestMapping(value = "/adminpanel")
	public String getAdminLoginPage() {
		return "/adminpanel/dashboard";
	}

	@RequestMapping(value = "/cart")
	public String getCart() {
		return "/userpanel/cart";
	}
	
	
	@RequestMapping(value="/myaccount")
	public String getMyAccount()
	{
		return "/userpanel/useraccount";
	}
	
	
	
	@RequestMapping(value="/activatedaccount",method=RequestMethod.GET)
	public ModelAndView activateAccount( @RequestParam(value = "session", required = false) Integer id,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		Users user = userService.findUserByUserId(id);
		user.setAccStatus(1);
		userService.saveUser(user);
		model.addObject("activeactive", "Congratulations Your acount Now has been activated.");
		model.setViewName("/userpanel/login");
		return model;
	}
	
	
	
	@RequestMapping(value = "/loginprocess", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "notApproved", required = false) String notApproved,
			@RequestParam(value = "duplicateSessionObject", required = false) String duplicateSessionObject,
			@RequestParam(value = "accessDenied", required = false) String accessdenided,
			@RequestParam(value = "accountnotactivate", required = false) String accountnotactivate,
			@RequestParam(value = "logout", required = false) String logout,
			HttpServletRequest request,HttpServletResponse response) {
			ModelAndView model = new ModelAndView();
			if (error != null) {
				model.addObject("error", "Invalid username and password!");
			}
			
			if (notApproved != null) {
				model.addObject("notApproved", "You are not authorised to login!");
			}
			
			if (duplicateSessionObject != null) {
				model.addObject("duplicateSessionObject", "You are already logged in another session");
			}
			
			if (accessdenided != null) {
				model.addObject("accessdenided", "You not have correct Credentials to access this page");
			}
			
			if(accountnotactivate!=null)
			{
				model.addObject("accountnotactivate", "Your email ID not verified .Please verify it in order to compelete signup process");
			}
			
			model.setViewName("/userpanel/login");
			return model;

		}
	
	
	@RequestMapping(value = "/logout")
	public String LogOut(HttpServletRequest request, HttpServletResponse response) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			updateLastLoginTime(auth);
		}
		return "redirect:/userlogin";
	}

	private void updateLastLoginTime(Authentication auth) {
		UserDetails userDetails = userService.findUserDetailsByEmail(auth.getName());
		UserLoginInfo userLoginInfo = new UserLoginInfo();
		userLoginInfo.setUserId(userDetails.getUserId());
		userLoginInfo.setLastLogin(AppConstant.getCurrentDateTime());
		userService.saveUserLastLogin(userLoginInfo);
	}

}
