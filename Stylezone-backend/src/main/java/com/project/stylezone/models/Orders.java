package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Orders {

	@Id
	@Column(name = "order_number")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int orderNumber;

	@Column(name = "order_id")
	private String orderId;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "rent_total")
	private long rentTotal;
	
	@Column(name = "deposite_total")
	private long depositeTotal;
	
	@Column(name = "total")
	private long total;
	
	@Column(name = "created_date")
	private String createdDate;
	


	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public long getRentTotal() {
		return rentTotal;
	}

	public void setRentTotal(long rentTotal) {
		this.rentTotal = rentTotal;
	}

	public long getDepositeTotal() {
		return depositeTotal;
	}

	public void setDepositeTotal(long depositeTotal) {
		this.depositeTotal = depositeTotal;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	
	
	
	
	
}
