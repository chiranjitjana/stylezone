package com.project.stylezone.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;
import com.project.stylezone.repository.OdersRepo;
import com.project.stylezone.repository.OrderItemRepo;

@Component
public class OrdersDaoImpl implements OrdersDao{

	@Autowired
	OdersRepo ordersRepo;
	
	@Autowired
	OrderItemRepo orderItemRepo;
	
	public Orders saveOrder(Orders order) {
		// TODO Auto-generated method stub
		return ordersRepo.save(order);
	}	
	
	public List<OrdersItem> saveOrderItems(List<OrdersItem> items){
		return (List<OrdersItem>) orderItemRepo.save(items);
	}
}
