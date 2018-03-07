package com.project.stylezone.service;

import com.project.stylezone.models.UserDetails;

public interface UserService {
	UserDetails findUserDetailsByEmail(String email);
}
