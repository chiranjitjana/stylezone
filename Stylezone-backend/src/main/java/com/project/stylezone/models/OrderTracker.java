package com.project.stylezone.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ordertracker")
public class OrderTracker {
	@Id
	@Column(name = "tracker_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int trackerId;
	

	@Column(name = "order_id")
	private String orderId;
	
	@Column(name = "order_status")
	private int orderStatus;
	
	
	@Column(name = "created_date ")
	private String createdDate;


	public int getTrackerId() {
		return trackerId;
	}


	public void setTrackerId(int trackerId) {
		this.trackerId = trackerId;
	}


	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public int getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}



	
	
	
}
