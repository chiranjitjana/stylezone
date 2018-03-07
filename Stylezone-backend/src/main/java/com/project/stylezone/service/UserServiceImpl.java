package com.project.stylezone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.UserDao;
import com.project.stylezone.models.UserDetails;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	public UserDetails findUserDetailsByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findUserDetailsByEmail(email);
	}

}
