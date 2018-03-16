package com.project.stylezone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.StocksDao;
import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.ColorView;

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

}
