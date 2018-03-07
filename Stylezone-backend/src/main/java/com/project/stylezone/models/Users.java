package com.project.stylezone.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class Users {
	@Id
	@Column(name="user_id", length=18)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer userId;

	@Column(name="user_name")
	private String userName;

	@Column(name="user_email")
	private String userEmail;
	
	@Column(name="password")
	private String password;

	@Column(name="user_mobile_no")
	private String userMobileNo;
	
	@OneToOne(cascade= {CascadeType.REFRESH, CascadeType.ALL},fetch=FetchType.EAGER)
	@JoinColumn(name="user_role")
	private UserRole userRole;
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserMobileNo() {
		return userMobileNo;
	}

	public void setUserMobileNo(String userMobileNo) {
		this.userMobileNo = userMobileNo;
	}

	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", password="
				+ password + ", userMobileNo=" + userMobileNo + ", userRole=" + userRole + "]";
	}
	
	
	
	
	
}
