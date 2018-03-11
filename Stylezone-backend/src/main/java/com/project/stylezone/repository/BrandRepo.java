package com.project.stylezone.repository;

import org.springframework.data.repository.CrudRepository;

import com.project.stylezone.models.Brand;

public interface BrandRepo extends CrudRepository<Brand, Integer> {

	Brand findByBrandName(String brandName);
}
