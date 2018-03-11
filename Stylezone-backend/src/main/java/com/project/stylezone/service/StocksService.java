package com.project.stylezone.service;

import java.util.List;

import com.project.stylezone.models.Brand;

public interface StocksService {

	List<Brand> getAllBrands();
	Brand saveOrUpdateBrand(Brand brand);
	List<Brand> removeBrand(Brand brand);
	Brand fetchBrandByName(String brandName);
}
