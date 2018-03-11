package com.project.stylezone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;
import com.project.stylezone.repository.AuthenticationVerifierRepo;
import com.project.stylezone.repository.UserLoginInfoRepo;
import com.project.stylezone.repository.UsersDetailsRepo;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	UsersDetailsRepo userDetailsRepo;
	
	@Autowired
	UserLoginInfoRepo loginRepo;
	
	@Autowired
	AuthenticationVerifierRepo authRepo;

	public UserDetails findUserDetailsByEmail(String email) {
		// TODO Auto-generated method stub
		return userDetailsRepo.findUserDetialsByEmail(email);

	}

	public void saveUserLastLogin(UserLoginInfo userloginInfo) {
		// TODO Auto-generated method stub
		loginRepo.save(userloginInfo);
	}

	public Users saveUser(Users user) {
		// TODO Auto-generated method stub
		return authRepo.save(user);
	}

}
