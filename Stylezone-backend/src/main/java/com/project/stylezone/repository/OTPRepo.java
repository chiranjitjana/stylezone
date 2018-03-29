package com.project.stylezone.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.stylezone.models.OTP;
import com.project.stylezone.models.Users;

public interface OTPRepo extends CrudRepository<OTP, Integer>{

	/*@Query("select otp from OTP user where otp.user =:user_id")
	OTP findOTPByUserId(@Param("user_id") Users userId);*/
	
	OTP findByUser(Users user);
	
	@Query("delete from OTP otp where otp.user =:userId")
	Integer deleteOtpByUserID(@Param("userId") Users userId);
	

	
}

