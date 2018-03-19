package com.project.stylezone.service;


import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserInfo;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;

public interface UserService {
	
	UserDetails findUserDetailsByEmail(String email);
	void saveUserLastLogin(UserLoginInfo userloginInfo);
	Users saveUser(Users user); 
}
