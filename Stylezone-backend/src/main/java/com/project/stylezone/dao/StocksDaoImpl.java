package com.project.stylezone.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Brand;
import com.project.stylezone.repository.BrandRepo;

@Component
public class StocksDaoImpl implements StocksDao {

	@Autowired
	BrandRepo brandRepo;
	
	public List<Brand> getAllBrands() {
		// TODO Auto-generated method stub
		return (List<Brand>) brandRepo.findAll();
	}

	public Brand saveOrUpdateBrand(Brand brand) {
		// TODO Auto-generated method stub
		return brandRepo.save(brand);
	}

	public List<Brand> removeBrand(Brand brand) {
		// TODO Auto-generated method stub
		brandRepo.delete(brand);
		return (List<Brand>) brandRepo.findAll();	
	}

	public Brand fetchBrandByName(String brandName) {
		// TODO Auto-generated method stub
		return brandRepo.findByBrandName(brandName);
	}

}
