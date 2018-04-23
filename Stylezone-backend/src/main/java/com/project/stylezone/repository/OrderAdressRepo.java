package com.project.stylezone.repository;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.OrderAddress;

public interface OrderAdressRepo extends CrudRepository<OrderAddress, Integer>{

	OrderAddress findByOrderId(String orderId);
}
