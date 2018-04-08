package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.ProductListView;

public interface ProductListViewRepo extends CrudRepository<ProductListView, Integer>{

	
	
}
