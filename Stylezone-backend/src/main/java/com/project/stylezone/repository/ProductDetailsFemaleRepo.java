package com.project.stylezone.repository;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.ProductDetailFemaleAttr;
import com.project.stylezone.models.ProductDetails;

public interface ProductDetailsFemaleRepo extends CrudRepository<ProductDetailFemaleAttr, Integer> {

	ProductDetailFemaleAttr findByProductDetails(ProductDetails details);
}
