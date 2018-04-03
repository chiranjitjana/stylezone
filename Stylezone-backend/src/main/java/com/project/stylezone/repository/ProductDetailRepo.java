package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.stylezone.models.ProductDetails;

public interface ProductDetailRepo extends CrudRepository<ProductDetails, Integer>{
	@Query("select productdtls from ProductDetails productdtls where productdtls.productTitle =:title")
	List<ProductDetails> findProductDetailsByTitle(@Param("title") String productTitle);

}
