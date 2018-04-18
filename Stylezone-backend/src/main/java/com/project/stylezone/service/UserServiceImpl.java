package com.project.stylezone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.UserDao;
import com.project.stylezone.models.Address;
import com.project.stylezone.models.OTP;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	public UserDetails findUserDetailsByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findUserDetailsByEmail(email);
	}

	public void saveUserLastLogin(UserLoginInfo userloginInfo) {
		// TODO Auto-generated method stub
		userDao.saveUserLastLogin(userloginInfo);
	}

	public Users saveUser(Users user) {
		// TODO Auto-generated method stub
		return userDao.saveUser(user);
	}

	public Users findUserByUserId(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findUserByUserId(id);
	}

	public Users findUserByUserEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findUserByUserEmail(email);
	}

	public OTP saveOTP(OTP otp) {
		// TODO Auto-generated method stub
		return userDao.saveOTP(otp);
	}

	public OTP findOTPByUser(Users user) {
		// TODO Auto-generated method stub
		return userDao.findOTPByUser(user);
	}

	public void deleteOTPforUser(OTP otp) {
		// TODO Auto-generated method stub
		userDao.deleteOTPforUser(otp);
	}

	public Address saveAddress(Address address) {
		// TODO Auto-generated method stub
		return userDao.saveAddress(address);
	}

	public List<Address> fetchAllAddress(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.fetchAllAddress(userId);
	}

	public void deleteAdrress(Integer addId) {
		// TODO Auto-generated method stub
		userDao.deleteAdrress(addId);
	}

}
