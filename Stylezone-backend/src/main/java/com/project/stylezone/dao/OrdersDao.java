package com.project.stylezone.dao;

import java.util.List;

import com.project.stylezone.models.CardDetails;
import com.project.stylezone.models.OrderAddress;
import com.project.stylezone.models.OrderTracker;
import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;

public interface OrdersDao {

	Orders saveOrder(Orders order);
	
	List<OrdersItem> saveOrderItems(List<OrdersItem> orderItem);
	
	OrderAddress saveOrderAddress(OrderAddress orderAdd);
	
	CardDetails saveCardDetailsforOrder(CardDetails cardDetails);
	
	Orders findOrderByOrderID(String orderId);
	OrderAddress findOrderAddByOrderID(String orderId);
	List<OrdersItem> findOrderItemsByOrderID(String orderId);
	
	OrderTracker saveOrUpdateOrderTracker(OrderTracker order);
	List<OrderTracker> fetchOrderTracker(String orderId);
}
