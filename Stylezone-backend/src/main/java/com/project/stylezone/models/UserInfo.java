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
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users_info")
public class UserInfo {

	@Id
	@Column(name="user_id")
	private Integer userId;
	

	@Column(name="address")
	private Integer address;


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public Integer getAddress() {
		return address;
	}


	public void setAddress(Integer address) {
		this.address = address;
	}
	
	
}
