package com.project.stylezone.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.stylezone.models.UserDetails;



public interface UsersDetailsRepo extends CrudRepository<UserDetails, Integer> {
	@Query("select user from UserDetails user where user.userEmail =:email")
	UserDetails findUserDetialsByEmail(@Param("email") String email);
}
