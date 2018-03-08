package com.project.stylezone.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.UserDetails;
import com.project.stylezone.repository.UsersDetailsRepo;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	UsersDetailsRepo userDetailsRepo;

	public UserDetails findUserDetailsByEmail(String email) {
		// TODO Auto-generated method stub

		System.out.println("email " + email);
		return userDetailsRepo.findUserDetialsByEmail(email);

	}

}
