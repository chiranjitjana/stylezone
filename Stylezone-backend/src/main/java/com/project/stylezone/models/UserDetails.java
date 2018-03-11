package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_details")
public class UserDetails {

	@Id
	@Column(name = "user_id")
	private int userId;

	@Column(name = "user_name")
	private String userName;

	@Column(name = "user_email")
	private String userEmail;

	@Column(name = "user_mobile_no")
	private String userMobileNo;

	@Column(name = "password")
	private String password;

	
	@Column(name = "user_role")
	private int roleId;

	
	@Column(name = "role_name")
	private String roleName;

	@Column(name = "last_login")
	private String lastLogin;

	/*@Column(name = "address")
	private String address;
*/
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	/*public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}*/

	
	
	
}
