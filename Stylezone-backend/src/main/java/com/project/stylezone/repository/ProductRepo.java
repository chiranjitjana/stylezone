package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.stylezone.models.Brand;
import com.project.stylezone.models.Category;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.Occasion;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.ProductDetails;
import com.project.stylezone.models.ProductListView;

public interface ProductRepo extends CrudRepository<Product, Integer> {

	@Query("select product from Product product where product.brand =:brand AND product.category=:category AND product.occasion=:occasion AND product.color=:color AND product.productDetails=:productdtls")
	List<Product> isExistsProduct(@Param("brand") Brand brand, @Param("category") Category category,
			@Param("occasion") Occasion occasion, @Param("color") Color color,
			@Param("productdtls") ProductDetails prodtsl);

	@Query("select product from Product product order by productId desc")
	List<Product> fetchAllProductByIDDesc();
	
}
