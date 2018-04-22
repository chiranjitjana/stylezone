package com.project.stylezone.dao;

import java.util.List;

import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;

public interface OrdersDao {

	Orders saveOrder(Orders order);
	
	List<OrdersItem> saveOrderItems(List<OrdersItem> orderItem);
}
