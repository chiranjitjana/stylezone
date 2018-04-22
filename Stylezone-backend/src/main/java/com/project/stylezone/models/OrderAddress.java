package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_address")
public class OrderAddress {
	
	@Id
	@Column(name = "add_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int addId;
	

	@Column(name = "order_id")
	private String orderId;
	
	
	@Column(name = "address")
	private String address;


	public int getAddId() {
		return addId;
	}


	public void setAddId(int addId) {
		this.addId = addId;
	}


	

	


	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
