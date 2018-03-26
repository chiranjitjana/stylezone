package com.project.stylezone.dao;


import com.project.stylezone.models.OTP;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;

public interface UserDao {

	UserDetails findUserDetailsByEmail(String email);
	void saveUserLastLogin(UserLoginInfo userloginInfo);
	Users saveUser(Users user);
	
	Users findUserByUserId(Integer id);
	Users findUserByUserEmail(String email);
	
	OTP saveOTP(OTP save);
}
