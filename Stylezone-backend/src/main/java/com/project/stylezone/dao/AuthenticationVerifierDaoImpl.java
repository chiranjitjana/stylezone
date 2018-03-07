package com.project.stylezone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Users;
import com.project.stylezone.repository.AuthenticationVerifierRepo;

@Component
public class AuthenticationVerifierDaoImpl implements AuthenticationVerifierDao{

	@Autowired
	AuthenticationVerifierRepo authRepo;
	
	public Users fetchUserByEmailAndPassword(String userName, String password) {
		// TODO Auto-generated method stub
		return authRepo.findUserByUserNameAndPassword(userName, password);
	}
	
	
}
