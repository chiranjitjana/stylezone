package com.project.stylezone.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cart_items_table")
public class CartItems {

	@Id
	@Column(name = "cart_item")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cartItem;
	
	
	@Column(name = "cart_id")
	private int cartId;
	
	@Column(name = "p_id")
	private int productId;
	
	@Column(name = "rental_price")
	private int rentPrice;
	
	
	@Column(name = "deposite_per")
	private int depositePrice;
	
	@Column(name = "start_date")
	private Date startDate;
	
	@Column(name = "end_date")
	private Date endDate;

	public int getCartItem() {
		return cartItem;
	}

	public void setCartItem(int cartItem) {
		this.cartItem = cartItem;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
	}

	public int getDepositePrice() {
		return depositePrice;
	}

	public void setDepositePrice(int depositePrice) {
		this.depositePrice = depositePrice;
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
	
	
	
	
	
	
	
	
}
