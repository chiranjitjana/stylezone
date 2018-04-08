package com.project.stylezone.repository;

import org.springframework.data.repository.CrudRepository;


import com.project.stylezone.models.ProductDetails;
import com.project.stylezone.models.ProductDetailsMaleAttr;

public interface ProductDetailsMaleRepo extends CrudRepository<ProductDetailsMaleAttr, Integer>{
	ProductDetailsMaleAttr findByProductDetails(ProductDetails details);
	
	
	
}
