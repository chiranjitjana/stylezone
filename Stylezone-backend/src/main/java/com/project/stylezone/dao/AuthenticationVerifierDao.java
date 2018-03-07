package com.project.stylezone.dao;

import com.project.stylezone.models.Users;

public interface AuthenticationVerifierDao {
	public Users fetchUserByEmailAndPassword(String userName,String password);
}
