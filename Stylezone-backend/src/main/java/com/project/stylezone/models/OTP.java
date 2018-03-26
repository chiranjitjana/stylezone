package com.project.stylezone.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.project.stylezone.AppConstant;

@Entity
@Table(name = "otp")
public class OTP {
	@Id
	@Column(name = "otp_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int otpId;

	@Column(name = "otp")
	private String otp=AppConstant.getOTP();
	
	@Column(name = "created_date")
	private Date createdDate=AppConstant.getDateTime();
	
	@Column(name = "expiry_date")
	private Date expiryDate;
	
	
	@ManyToOne(cascade= {CascadeType.REFRESH},fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")
	private Users user;


	public int getOtpId() {
		return otpId;
	}


	public void setOtpId(int otpId) {
		this.otpId = otpId;
	}


	public String getOtp() {
		return otp;
	}


	public void setOtp(String otp) {
		this.otp = otp;
	}


	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public Date getExpiryDate() {
		return expiryDate;
	}


	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}


	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}
	
	
	
	
}
