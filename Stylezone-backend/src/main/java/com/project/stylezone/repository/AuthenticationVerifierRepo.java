package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.stylezone.models.Users;

public interface AuthenticationVerifierRepo extends CrudRepository<Users,Integer>{
	@Query("select user from Users user where user.userEmail =:username AND user.password=:password")
	Users findUserByUserNameAndPassword(@Param("username") String username, @Param("password") String password);
	
	Users findUserByUserId(Integer userId);
	Users findUserByUserEmail(String email);
	
	@Query("select user from Users user where user.userRole=1 and user.accStatus=0")
	List<Users> findAdminUserAccStusInactive();
}
