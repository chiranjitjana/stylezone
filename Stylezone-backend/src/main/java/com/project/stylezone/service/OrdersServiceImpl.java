package com.project.stylezone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.OrdersDao;
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

}
