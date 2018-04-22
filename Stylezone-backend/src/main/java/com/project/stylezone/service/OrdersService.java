package com.project.stylezone.service;

import java.util.List;

import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;

public interface OrdersService {
	Orders saveOrder(Orders order);
	List<OrdersItem> saveOrderItems(List<OrdersItem> orderItem);
}
