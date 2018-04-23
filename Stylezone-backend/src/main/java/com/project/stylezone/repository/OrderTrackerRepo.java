package com.project.stylezone.repository;



import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.OrderTracker;

public interface OrderTrackerRepo extends CrudRepository<OrderTracker, Integer> {

	List<OrderTracker> findByOrderId(String orderId);
}
