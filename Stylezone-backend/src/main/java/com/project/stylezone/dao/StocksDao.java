package com.project.stylezone.dao;

import java.util.List;

import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;
import com.project.stylezone.models.Category;
import com.project.stylezone.models.CategoryView;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.ColorView;
import com.project.stylezone.models.Occasion;
import com.project.stylezone.models.OccasionView;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.ProductDetailFemaleAttr;
import com.project.stylezone.models.ProductDetailsMaleAttr;
import com.project.stylezone.models.ProductListView;

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
	
	
	
	/***occasion
	 */
	List<Occasion> getAllOccasion();
	Occasion saveOrUpdateOccasion(Occasion occasion);
	List<Occasion> removeOccasion(Occasion occasion);
	Occasion fetchOccasionByName(String occasion);
	List<OccasionView> getAllOccasionswithCreatorName();
	Occasion fetchOccasiondById(Occasion Occasion);
	
	
	/***category
	 */
	List<Category> getAllCat();
	Category saveOrUpdateCat(Category cat);
	List<Category> removeCat(Category cat);
	Category fetchCatByName(String cat);
	List<CategoryView> getAllCatwithCreatorName();
	Category fetchCatById(Category Occasion);

	
	/***Product
	 */
	//List<Pro> getAllCat();
	Product saveOrUpdateProdct(Product product);
	ProductDetailsMaleAttr saveOrUpdateProdctMale(ProductDetailsMaleAttr product);
	ProductDetailFemaleAttr saveOrUpdateProdctFemale(ProductDetailFemaleAttr product);
	boolean checkProductExists(Product product);
	List<ProductListView> getAllProducts();
}
