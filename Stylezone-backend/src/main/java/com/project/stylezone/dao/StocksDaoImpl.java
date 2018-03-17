package com.project.stylezone.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.stylezone.models.Brand;
import com.project.stylezone.models.BrandView;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.ColorView;
import com.project.stylezone.models.Occasion;
import com.project.stylezone.models.OccasionView;
import com.project.stylezone.repository.BrandRepo;
import com.project.stylezone.repository.BrandViewRepo;
import com.project.stylezone.repository.ColorRepo;
import com.project.stylezone.repository.ColorViewRepo;
import com.project.stylezone.repository.OccasionRepo;
import com.project.stylezone.repository.OccasionViewRepo;

@Component
public class StocksDaoImpl implements StocksDao {

	@Autowired
	BrandRepo brandRepo;
	
	@Autowired
	BrandViewRepo brandViewRepo;
	
	
	
	
	@Autowired
	ColorViewRepo colorViewRepo;
	
	
	@Autowired
	ColorRepo colorRepo;
	
	
	@Autowired
	OccasionViewRepo occasionViewRepo;
	
	
	@Autowired
	OccasionRepo occasionRepo;

	
	
	public List<Brand> getAllBrands() {
		// TODO Auto-generated method stub
		//return (List<Brand>) brandRepo.findAll();
		
		return brandRepo.findAllBrandByLatestCreatedDate();
	}

	public Brand saveOrUpdateBrand(Brand brand) {
		// TODO Auto-generated method stub
		return brandRepo.save(brand);
	}

	public List<Brand> removeBrand(Brand brand) {
		// TODO Auto-generated method stub
		brandRepo.delete(brand);
		return  (List<Brand>) brandRepo.findAll();	
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

	
	
	
	
	
	
	
	
	
	public List<Color> getAllColors() {
		// TODO Auto-generated method stub
		return (List<Color>)colorRepo.findAllColorByLatestCreatedDate();
	}

	public Color saveOrUpdateColor(Color color) {
		// TODO Auto-generated method stub
		return colorRepo.save(color);
	}

	public List<Color> removeBrand(Color color) {
		// TODO Auto-generated method stub
		 colorRepo.delete(color);
		 return (List<Color>) colorRepo.findAll();	
	}

	public Color fetchColorByName(String colorName) {
		// TODO Auto-generated method stub
		return colorRepo.findByColorName(colorName);
	}

	public Color fetchColorByCode(String colorCode) {
		// TODO Auto-generated method stub
		return colorRepo.findByColorCode(colorCode);
	}

	public List<ColorView> getAllColorswithCreatorName() {
		// TODO Auto-generated method stub
		return (List<ColorView>) colorViewRepo.findAll();
	}

	public Color fetchColordById(Color color) {
		// TODO Auto-generated method stub
		return colorRepo.findByColorId(color.getColorId());
	}

	
	
	
	
	
	
	
	public List<Occasion> getAllOccasion() {
		// TODO Auto-generated method stub
		return occasionRepo.findAllOccasionByLatestCreatedDate();
	}

	public Occasion saveOrUpdateOccasion(Occasion occasion) {
		// TODO Auto-generated method stub
		return occasionRepo.save(occasion);
	}

	public List<Occasion> removeOccasion(Occasion occasion) {
		// TODO Auto-generated method stub
		 occasionRepo.delete(occasion);
		 return (List<Occasion>) occasionRepo.findAll();
	}

	public Occasion fetchOccasionByName(String occasion) {
		// TODO Auto-generated method stub
		return occasionRepo.findByOccasionName(occasion);
	}

	public List<OccasionView> getAllOccasionswithCreatorName() {
		// TODO Auto-generated method stub
		return (List<OccasionView>) occasionViewRepo.findAll();
	}

	public Occasion fetchOccasiondById(Occasion occasion) {
		// TODO Auto-generated method stub
		return occasionRepo.findByOccasionId(occasion.getOccasionId());
	}


}
