package com.project.stylezone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.AuthenticationVerifierDao;
import com.project.stylezone.models.Users;

@Service
public class AuthenticationVerifierImpl implements AuthenticationVerifier{

	@Autowired
	AuthenticationVerifierDao authDao;

	public Users fetchUserByEmailAndPassword(String userName, String password) {
		// TODO Auto-generated method stub
		return authDao.fetchUserByEmailAndPassword(userName, password);
	}
	
}
