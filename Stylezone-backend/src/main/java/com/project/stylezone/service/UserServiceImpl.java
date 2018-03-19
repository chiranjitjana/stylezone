package com.project.stylezone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.UserDao;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;

@Service
public class UserServiceImpl implements UserService{

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

	

}
