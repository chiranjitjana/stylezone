package com.project.stylezone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.stylezone.models.UserDetails;
import com.project.stylezone.service.UserService;

@Controller
public class AdminBackendServiceController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/adminpanel/getAdminDetailsByEmail", method = RequestMethod.POST)
	public @ResponseBody UserDetails getUserByEmail(@RequestParam(name="email") String email) {
		UserDetails userDetails = userService.findUserDetailsByEmail(email);
		return userDetails;
	}

}
