package com.project.stylezone.service;

import com.project.stylezone.models.Users;

public interface AuthenticationVerifier {
	public Users fetchUserByEmailAndPassword(String userName,String password);
}
