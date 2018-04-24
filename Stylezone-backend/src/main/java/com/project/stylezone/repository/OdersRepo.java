package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.stylezone.models.Orders;

public interface OdersRepo extends CrudRepository<Orders, String>{

	Orders findByOrderId(String orderId);
	
	@Query("select orders from Orders orders where orders.userId=:userId order by orderNumber desc")
	List<Orders> findByUserId(@Param("userId") int userId);
	
	@Query("select orders from Orders orders order by orderNumber desc")
	List<Orders> findAllOrdersFromNewToOld();
}
