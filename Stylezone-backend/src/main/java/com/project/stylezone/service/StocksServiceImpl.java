package com.project.stylezone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.StocksDao;
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

@Service
public class StocksServiceImpl implements StocksService {

	@Autowired
	StocksDao stocksDao;

	public List<Brand> getAllBrands() {
		// TODO Auto-generated method stub
		return stocksDao.getAllBrands();
	}

	public Brand saveOrUpdateBrand(Brand brand) {
		// TODO Auto-generated method stub
		return stocksDao.saveOrUpdateBrand(brand);
	}

	public List<Brand> removeBrand(Brand brand) {
		// TODO Auto-generated method stub
		return stocksDao.removeBrand(brand);
	}

	public Brand fetchBrandByName(String brandName) {
		// TODO Auto-generated method stub
		return stocksDao.fetchBrandByName(brandName);
	}

	public List<BrandView> getAllBrandwithCreatorName() {
		// TODO Auto-generated method stub
		return stocksDao.getAllBrandwithCreatorName();
	}

	public Brand fetchBrandById(Brand brand) {
		// TODO Auto-generated method stub
		return stocksDao.fetchBrandById(brand);
	}

	public List<Color> getAllColors() {
		// TODO Auto-generated method stub
		return stocksDao.getAllColors();
	}

	public Color saveOrUpdateColor(Color color) {
		// TODO Auto-generated method stub
		return stocksDao.saveOrUpdateColor(color);
	}

	public List<Color> removeBrand(Color color) {
		// TODO Auto-generated method stub
		return stocksDao.removeBrand(color);
	}

	public Color fetchColorByName(String color) {
		// TODO Auto-generated method stub
		return stocksDao.fetchColorByName(color);
	}

	public Color fetchColorByCode(String code) {
		// TODO Auto-generated method stub
		return stocksDao.fetchColorByCode(code);
	}

	public List<ColorView> getAllColorswithCreatorName() {
		// TODO Auto-generated method stub
		return stocksDao.getAllColorswithCreatorName();
	}

	public Color fetchColordById(Color color) {
		// TODO Auto-generated method stub
		return stocksDao.fetchColordById(color);
	}

	public List<Occasion> getAllOccasion() {
		// TODO Auto-generated method stub
		return stocksDao.getAllOccasion();
	}

	public Occasion saveOrUpdateOccasion(Occasion occasion) {
		// TODO Auto-generated method stub
		return stocksDao.saveOrUpdateOccasion(occasion);
	}

	public List<Occasion> removeOccasion(Occasion occasion) {
		// TODO Auto-generated method stub
		return stocksDao.removeOccasion(occasion);
	}

	public Occasion fetchOccasionByName(String occasion) {
		// TODO Auto-generated method stub
		return stocksDao.fetchOccasionByName(occasion);
	}

	public List<OccasionView> getAllOccasionswithCreatorName() {
		// TODO Auto-generated method stub
		return stocksDao.getAllOccasionswithCreatorName();
	}

	public Occasion fetchOccasiondById(Occasion Occasion) {
		// TODO Auto-generated method stub
		return stocksDao.fetchOccasiondById(Occasion);
	}

	public List<Category> getAllCat() {
		// TODO Auto-generated method stub
		return stocksDao.getAllCat();
	}

	public Category saveOrUpdateCat(Category cat) {
		// TODO Auto-generated method stub
		return stocksDao.saveOrUpdateCat(cat);
	}

	public List<Category> removeCat(Category cat) {
		// TODO Auto-generated method stub
		return stocksDao.removeCat(cat);
	}

	public Category fetchCatByName(String cat) {
		// TODO Auto-generated method stub
		return stocksDao.fetchCatByName(cat);
	}

	public List<CategoryView> getAllCatwithCreatorName() {
		// TODO Auto-generated method stub
		return stocksDao.getAllCatwithCreatorName();
	}

	public Category fetchCatById(Category cat) {
		// TODO Auto-generated method stub
		return stocksDao.fetchCatById(cat);
	}

	public Product saveOrUpdateProdct(Product product) {
		// TODO Auto-generated method stub
		return stocksDao.saveOrUpdateProdct(product);
	}

	public ProductDetailsMaleAttr saveOrUpdateProdctMale(ProductDetailsMaleAttr product) {
		// TODO Auto-generated method stub
		return stocksDao.saveOrUpdateProdctMale(product);
	}

	public ProductDetailFemaleAttr saveOrUpdateProdctFemale(ProductDetailFemaleAttr product) {
		// TODO Auto-generated method stub
		return stocksDao.saveOrUpdateProdctFemale(product);
	}

	public boolean checkProductExists(Product product) {
		// TODO Auto-generated method stub
		return stocksDao.checkProductExists(product);
	}

	public List<ProductListView> getAllProducts() {
		// TODO Auto-generated method stub
		return stocksDao.getAllProducts();
	}


}
