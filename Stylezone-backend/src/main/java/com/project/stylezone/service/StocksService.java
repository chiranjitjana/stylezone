package com.project.stylezone.service;

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
import com.project.stylezone.models.ProductDetails;
import com.project.stylezone.models.ProductDetailsMaleAttr;
import com.project.stylezone.models.ProductListView;

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
	Product fetchAProduct(Integer productId);
	ProductDetailsMaleAttr saveOrUpdateProdctMale(ProductDetailsMaleAttr product);
	ProductDetailFemaleAttr saveOrUpdateProdctFemale(ProductDetailFemaleAttr product);
	
	ProductDetailsMaleAttr fetchMaleAttr(Integer maleId);
	ProductDetailFemaleAttr fetchFemale(Integer femaleId);
	
	List<ProductListView> getAllProducts();
	/*List<Category> removeCat(Category cat);
	Category fetchCatByName(String cat);
	
	Category fetchCatById(Category Occasion);*/
	boolean checkProductExists(Product product);
	ProductDetails fetchSingleProductDetails(Integer productDetailsId);
	void removeMaleAttrById(Integer id);
	void removeFemaleAttrById(Integer id);
	void removeProductDts(Integer id);
	void removeProduct(Product product);
	List<Product> fetchAllProductByIDDesc();
	
	
}
