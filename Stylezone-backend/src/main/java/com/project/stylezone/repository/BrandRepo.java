package com.project.stylezone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.Brand;

public interface BrandRepo extends CrudRepository<Brand, Integer> {

	Brand findByBrandName(String brandName);
	
	@Query("select brand from Brand brand order by brandId desc")
	List<Brand> findAllBrandByLatestCreatedDate();
}
