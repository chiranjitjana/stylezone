package com.project.stylezone;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.stylezone.models.Cart;
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
	
	
	public static boolean addSessionProduct(SessionProduct product,HttpServletRequest request) {
		// TODO Auto-generated method stub
		boolean ret=false;
		SessionCart cart = getCart(request);
		List<SessionProduct> products = cart.getProducts();
		
		if(SessionController.checkProductExists(products,product)) {
			products.add(product);
			cart.setProducts(products);
			request.getSession().setAttribute("Cart", cart);
			ret=true;
		}
	
		return ret;
		
	}

	private static boolean checkProductExists(List<SessionProduct> products, SessionProduct product) {
		// TODO Auto-generated method stub
		
		for (SessionProduct sessionProduct : products) {
			if(sessionProduct.getProductId()==product.getProductId()) {
				return false;
			}
			
		}
		
		return true;
	}


	public static List<SessionProduct> getProductList(HttpServletRequest request){
		return getCart(request).getProducts();
	}


	public static Object removeProduct(Integer porductID, HttpServletRequest httpRequest) {
		// TODO Auto-generated method stub
		
		List<SessionProduct> products = getCart(httpRequest).getProducts();
		
		for(int x=0;x<products.size();x++) {
			if(products.get(x).getProductId()==porductID)
			{
				products.remove(x);
				break;
			}
		}
		SessionCart cart = getCart(httpRequest);
		cart.setProducts(products);
		return products;
	}


	public static void updateCartProductAppointmentDate(SessionCart cart,
			HttpServletRequest httpRequest) {
		// TODO Auto-generated method stub
		httpRequest.getSession().setAttribute("Cart", cart);
	
	}
}
