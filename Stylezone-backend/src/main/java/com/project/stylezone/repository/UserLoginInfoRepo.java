package com.project.stylezone.repository;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.UserLoginInfo;

public interface UserLoginInfoRepo extends CrudRepository<UserLoginInfo, Integer>{

}
