package com.project.stylezone.dao;

import com.project.stylezone.models.UserDetails;

public interface UserDao {
	UserDetails findUserDetailsByEmail(String email);
}
