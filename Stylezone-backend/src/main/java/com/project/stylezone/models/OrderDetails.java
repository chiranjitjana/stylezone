package com.project.stylezone.models;

import java.util.List;

public class OrderDetails {
	private String orderId;
	private long rentTotal;
	private long depositeTotal;
	private long total;
	private String createdDate;
	private String useremail;
	private String userphone;
	private String address;
	private int productCount;
	private String username;
	
	private List<OrderTracker> tracker;
	List<OrderProduct> tempOrderProductList;
	
	
	
	
	
	
	public List<OrderTracker> getTracker() {
		return tracker;
	}
	public void setTracker(List<OrderTracker> tracker) {
		this.tracker = tracker;
	}
	public List<OrderProduct> getTempOrderProductList() {
		return tempOrderProductList;
	}
	public void setTempOrderProductList(List<OrderProduct> tempOrderProductList) {
		this.tempOrderProductList = tempOrderProductList;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
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
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	
	
}
