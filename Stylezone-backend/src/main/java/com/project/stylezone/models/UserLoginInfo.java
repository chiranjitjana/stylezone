package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "login_info")
public class UserLoginInfo {

	@Id
	@Column(name = "user_id")
	private int userId;

	@Column(name = "last_login")
	private String lastLogin;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

}
