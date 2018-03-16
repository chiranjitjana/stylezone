package com.project.stylezone.dao;

import java.util.List;

import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.ColorView;

public interface StocksDao {

	/***brand
	 */
	List<Brand> getAllBrands();
	Brand saveOrUpdateBrand(Brand brand);
	List<Brand> removeBrand(Brand brand);
	Brand fetchBrandByName(String brandName);
	List<BrandView> getAllBrandwithCreatorName();
	Brand fetchBrandById(Brand brand);
	
	
	
	/***colors
	 */
	List<Color> getAllColors();
	Color saveOrUpdateColor(Color color);
	List<Color> removeBrand(Color color);
	Color fetchColorByName(String color);
	Color fetchColorByCode(String code);
	List<ColorView> getAllColorswithCreatorName();
	Color fetchColordById(Color color);
	
}
