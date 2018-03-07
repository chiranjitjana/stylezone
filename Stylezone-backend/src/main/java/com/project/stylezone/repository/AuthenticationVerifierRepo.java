package com.project.stylezone.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.stylezone.models.Users;

public interface AuthenticationVerifierRepo extends CrudRepository<Users,Integer>{
	@Query("select user from Users user where user.userEmail =:username AND user.password=:password")
	Users findUserByUserNameAndPassword(@Param("username") String username, @Param("password") String password);
}
