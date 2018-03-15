package com.project.stylezone.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;
import com.project.stylezone.repository.BrandRepo;
import com.project.stylezone.repository.BrandViewRepo;

@Component
public class StocksDaoImpl implements StocksDao {

	@Autowired
	BrandRepo brandRepo;
	
	@Autowired
	BrandViewRepo brandViewRepo;
	
	public List<Brand> getAllBrands() {
		// TODO Auto-generated method stub
		//return (List<Brand>) brandRepo.findAll();
		
		return (List<Brand>)brandRepo.findAllBrandByLatestCreatedDate();
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

	public List<BrandView> getAllBrandwithCreatorName() {
		// TODO Auto-generated method stub
		return (List<BrandView>) brandViewRepo.findAll();
	}

	public Brand fetchBrandById(Brand brand) {
		// TODO Auto-generated method stub
		return brandRepo.findByBrandId(brand.getBrandId());
	}

}
