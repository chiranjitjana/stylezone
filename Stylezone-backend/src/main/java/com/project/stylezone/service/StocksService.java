package com.project.stylezone.service;

import java.util.List;

import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.ColorView;
import com.project.stylezone.models.Occasion;
import com.project.stylezone.models.OccasionView;

public interface StocksService {

	/***brand
	 */
	List<Brand> getAllBrands();
	Brand saveOrUpdateBrand(Brand brand);
	List<Brand> removeBrand(Brand brand);
	Brand fetchBrandByName(String brandName);
	Brand fetchBrandById(Brand brand);
	List<BrandView> getAllBrandwithCreatorName();
	
	
	
	/***colors
	 */
	List<Color> getAllColors();
	Color saveOrUpdateColor(Color color);
	List<Color> removeBrand(Color color);
	Color fetchColorByName(String color);
	Color fetchColorByCode(String code);
	List<ColorView> getAllColorswithCreatorName();
	Color fetchColordById(Color color);
	
	
	
	/***occasion
	 */
	List<Occasion> getAllOccasion();
	Occasion saveOrUpdateOccasion(Occasion occasion);
	List<Occasion> removeOccasion(Occasion occasion);
	Occasion fetchOccasionByName(String occasion);
	List<OccasionView> getAllOccasionswithCreatorName();
	Occasion fetchOccasiondById(Occasion Occasion);

	
}
