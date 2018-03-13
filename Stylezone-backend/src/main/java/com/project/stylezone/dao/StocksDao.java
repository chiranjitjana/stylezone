package com.project.stylezone.dao;

import java.util.List;

import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;

public interface StocksDao {

	List<Brand> getAllBrands();
	Brand saveOrUpdateBrand(Brand brand);
	List<Brand> removeBrand(Brand brand);
	Brand fetchBrandByName(String brandName);
	List<BrandView> getAllBrandwithCreatorName();
}
