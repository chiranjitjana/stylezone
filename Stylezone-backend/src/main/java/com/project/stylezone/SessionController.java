package com.project.stylezone;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.stylezone.models.SessionCart;
import com.project.stylezone.models.SessionProduct;

public class SessionController {

	private List<SessionProduct> productList=new ArrayList<SessionProduct>();
	
	public static SessionCart getCart(HttpServletRequest request) {

		SessionCart cart = (SessionCart) request.getSession().getAttribute("Cart");

		if (cart == null) {
			cart = new SessionCart();
			cart.initProductList();
			request.getSession().setAttribute("Cart", cart);

		}
		return cart;

	}
	
	
	public static void addSessionProduct(SessionProduct product,HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		SessionCart cart = getCart(request);
		List<SessionProduct> products = cart.getProducts();
		
		if(!products.contains(product)) {
			products.add(product);
			cart.setProducts(products);
			request.getSession().setAttribute("Cart", cart);
		}
	
		
	}

	public static List<SessionProduct> getProductList(HttpServletRequest request){
		return getCart(request).getProducts();
	}
}
