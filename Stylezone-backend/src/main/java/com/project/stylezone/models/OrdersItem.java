package com.project.stylezone.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "order_item")
public class OrdersItem {

	@Id
	@Column(name = "order_item_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer orderItemId;
	
	@Column(name = "order_id")
	private String orderId;

	@Column(name = "product_id")
	private Integer productId;
	
	@Column(name = "custom_fitting_available")
	private String customFitting;
	
	@Column(name = "custom_fitting_app_date")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	private Date customFittingAppointmentDate;
	
	@Column(name = "start_date")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	private Date startDate;
	
	@Column(name = "end_date")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	private Date endDate;
	
	@Column(name = "duration")
	private Integer duration;
	
	@Column(name = "rent_price")
	private Integer rentPrice;
	
	@Column(name = "deposite_price")
	private Integer deposite;
	
	@Column(name = "total_price")
	private Integer totalPrice;

	

	public Integer getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Integer orderItemId) {
		this.orderItemId = orderItemId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getCustomFitting() {
		return customFitting;
	}

	public void setCustomFitting(String customFitting) {
		this.customFitting = customFitting;
	}

	

	public Date getCustomFittingAppointmentDate() {
		return customFittingAppointmentDate;
	}

	public void setCustomFittingAppointmentDate(Date customFittingAppointmentDate) {
		this.customFittingAppointmentDate = customFittingAppointmentDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Integer getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(Integer rentPrice) {
		this.rentPrice = rentPrice;
	}

	public Integer getDeposite() {
		return deposite;
	}

	public void setDeposite(Integer deposite) {
		this.deposite = deposite;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	
	
}
