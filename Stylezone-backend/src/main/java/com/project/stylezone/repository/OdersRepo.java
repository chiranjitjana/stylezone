package com.project.stylezone.repository;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.Orders;

public interface OdersRepo extends CrudRepository<Orders, String>{

	Orders findByOrderId(String orderId);
	
}
