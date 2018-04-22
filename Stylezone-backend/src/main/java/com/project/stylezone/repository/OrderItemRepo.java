package com.project.stylezone.repository;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.OrdersItem;

public interface OrderItemRepo extends CrudRepository<OrdersItem, Integer>{

}
