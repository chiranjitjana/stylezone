package com.project.stylezone.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.CardDetails;
import com.project.stylezone.models.OrderAddress;
import com.project.stylezone.models.OrderTracker;
import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;
import com.project.stylezone.repository.CardDetailsRepo;
import com.project.stylezone.repository.OdersRepo;
import com.project.stylezone.repository.OrderAdressRepo;
import com.project.stylezone.repository.OrderItemRepo;
import com.project.stylezone.repository.OrderTrackerRepo;

@Component
public class OrdersDaoImpl implements OrdersDao{

	@Autowired
	OdersRepo ordersRepo;
	
	@Autowired
	OrderItemRepo orderItemRepo;
	
	@Autowired
	OrderAdressRepo orderAddressRepo;
	
	@Autowired
	CardDetailsRepo cardDetailsRepo;
	
	@Autowired
	OrderTrackerRepo orderTrackerRepo;
	
	public Orders saveOrder(Orders order) {
		// TODO Auto-generated method stub
		return ordersRepo.save(order);
	}	
	
	public List<OrdersItem> saveOrderItems(List<OrdersItem> items){
		return (List<OrdersItem>) orderItemRepo.save(items);
	}

	public OrderAddress saveOrderAddress(OrderAddress orderAdd) {
		// TODO Auto-generated method stub
		return orderAddressRepo.save(orderAdd);
	}

	public CardDetails saveCardDetailsforOrder(CardDetails cardDetails) {
		// TODO Auto-generated method stub
		return cardDetailsRepo.save(cardDetails);
	}

	public Orders findOrderByOrderID(String orderId) {
		// TODO Auto-generated method stub
		return ordersRepo.findByOrderId(orderId);
	}

	public OrderAddress findOrderAddByOrderID(String orderId) {
		// TODO Auto-generated method stub
		return orderAddressRepo.findByOrderId(orderId);
	}

	public List<OrdersItem> findOrderItemsByOrderID(String orderId) {
		// TODO Auto-generated method stub
		return orderItemRepo.findByOrderId(orderId);
	}

	public OrderTracker saveOrUpdateOrderTracker(OrderTracker order) {
		// TODO Auto-generated method stub
		return orderTrackerRepo.save(order);
	}

	public List<OrderTracker> fetchOrderTracker(String orderId) {
		// TODO Auto-generated method stub
		return orderTrackerRepo.findByOrderId(orderId);
	}
}
