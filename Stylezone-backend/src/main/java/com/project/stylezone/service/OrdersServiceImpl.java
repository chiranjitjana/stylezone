package com.project.stylezone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.OrdersDao;
import com.project.stylezone.models.CardDetails;
import com.project.stylezone.models.OrderAddress;
import com.project.stylezone.models.OrderTracker;
import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;

@Service
public class OrdersServiceImpl implements OrdersService{

	@Autowired
	OrdersDao orderDao;
	
	public Orders saveOrder(Orders order) {
		// TODO Auto-generated method stub
		return orderDao.saveOrder(order);
	}

	public List<OrdersItem> saveOrderItems(List<OrdersItem> orderItem) {
		// TODO Auto-generated method stub
		return orderDao.saveOrderItems(orderItem);
	}

	public OrderAddress saveOrderAddress(OrderAddress orderAdd) {
		// TODO Auto-generated method stub
		return orderDao.saveOrderAddress(orderAdd);
	}

	public CardDetails saveCardDetailsforOrder(CardDetails cardDetails) {
		// TODO Auto-generated method stub
		return orderDao.saveCardDetailsforOrder(cardDetails);
	}

	public Orders findOrderByOrderID(String orderId) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByOrderID(orderId);
	}

	public OrderAddress findOrderAddByOrderID(String orderId) {
		// TODO Auto-generated method stub
		return orderDao.findOrderAddByOrderID(orderId);
	}

	public List<OrdersItem> findOrderItemsByOrderID(String orderId) {
		// TODO Auto-generated method stub
		return orderDao.findOrderItemsByOrderID(orderId);
	}

	public OrderTracker saveOrUpdateOrderTracker(OrderTracker order) {
		// TODO Auto-generated method stub
		return orderDao.saveOrUpdateOrderTracker(order);
	}

	public List<OrderTracker> fetchOrderTracker(String orderId) {
		// TODO Auto-generated method stub
		return orderDao.fetchOrderTracker(orderId);
	}

}
