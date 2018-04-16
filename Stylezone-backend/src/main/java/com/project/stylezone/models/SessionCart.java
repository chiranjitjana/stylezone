package com.project.stylezone.models;

import java.util.ArrayList;
import java.util.List;

public class SessionCart {
	
	private Integer cartId;
	
	private  List<SessionProduct> products;

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public List<SessionProduct> getProducts() {
		return products;
	}

	public void setProducts(List<SessionProduct> products) {
		this.products = products;
	}

	public void initProductList() {
		// TODO Auto-generated method stub
		products=new ArrayList<SessionProduct>();
	}

	
}
