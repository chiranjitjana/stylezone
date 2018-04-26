package com.project.stylezone.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Address;
import com.project.stylezone.models.OTP;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;
import com.project.stylezone.repository.AdressRepo;
import com.project.stylezone.repository.AuthenticationVerifierRepo;
import com.project.stylezone.repository.OTPRepo;
import com.project.stylezone.repository.UserLoginInfoRepo;
import com.project.stylezone.repository.UsersDetailsRepo;

@Component
public class UserDaoImpl implements UserDao {

	@Autowired
	UsersDetailsRepo userDetailsRepo;
	
	@Autowired
	UserLoginInfoRepo loginRepo;
	
	@Autowired
	AuthenticationVerifierRepo authRepo;
	
	@Autowired
	OTPRepo otpRepo;
	
	
	@Autowired
	AdressRepo adressRepo;
	
	
	@Autowired
	AuthenticationVerifierRepo authenticationVerifierRepo;

	public UserDetails findUserDetailsByEmail(String email) {
		// TODO Auto-generated method stub
		return userDetailsRepo.findUserDetialsByEmail(email);

	}

	public void saveUserLastLogin(UserLoginInfo userloginInfo) {
		// TODO Auto-generated method stub
		loginRepo.save(userloginInfo);
	}

	public Users saveUser(Users user) {
		// TODO Auto-generated method stub
		return authRepo.save(user);
	}

	public Users findUserByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return authRepo.findUserByUserId(userId);
	}

	public Users findUserByUserEmail(String email) {
		// TODO Auto-generated method stub
		return authRepo.findUserByUserEmail(email);
	}

	public OTP saveOTP(OTP otp) {
		// TODO Auto-generated method stub
		return otpRepo.save(otp);
	}

	public OTP findOTPByUser(Users user) {
		// TODO Auto-generated method stub
		return otpRepo.findByUser(user);
	}


	public void deleteOTPforUser(OTP otp) {
		// TODO Auto-generated method stub
		 otpRepo.delete(otp);
	}

	public Address saveAddress(Address address) {
		// TODO Auto-generated method stub
		return adressRepo.save(address);
	}

	public List<Address> fetchAllAddress(Integer userId) {
		// TODO Auto-generated method stub
		return adressRepo.findByUserId(userId);
	}

	public void deleteAdrress(Integer addId) {
		// TODO Auto-generated method stub
		adressRepo.delete(addId);
	}

	public List<Users> findAllAdminUserByAccStatusInactive() {
		// TODO Auto-generated method stub
		return authenticationVerifierRepo.findAdminUserAccStusInactive();
	}

	public void deleteUser(Users user) {
		// TODO Auto-generated method stub
		authenticationVerifierRepo.delete(user);
	}


}
