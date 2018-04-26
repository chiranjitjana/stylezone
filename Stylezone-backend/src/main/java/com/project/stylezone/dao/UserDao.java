package com.project.stylezone.dao;


import java.util.List;

import com.project.stylezone.models.Address;
import com.project.stylezone.models.OTP;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;

public interface UserDao {

	UserDetails findUserDetailsByEmail(String email);
	void saveUserLastLogin(UserLoginInfo userloginInfo);
	Users saveUser(Users user);
	void deleteUser(Users user);
	Users findUserByUserId(Integer id);
	Users findUserByUserEmail(String email);
	List<Users> findAllAdminUserByAccStatusInactive();
	
	OTP saveOTP(OTP save);
	OTP findOTPByUser(Users user);
	
	void deleteOTPforUser(OTP otp);
	
	
	Address saveAddress(Address address);
	List<Address> fetchAllAddress(Integer userId);
	void deleteAdrress(Integer addId);
}
