package com.project.stylezone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.stylezone.dao.StocksDao;
import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;

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

}
