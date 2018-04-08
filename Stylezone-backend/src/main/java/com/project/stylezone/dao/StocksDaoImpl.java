package com.project.stylezone.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
import com.project.stylezone.repository.BrandRepo;
import com.project.stylezone.repository.BrandViewRepo;
import com.project.stylezone.repository.CatRepo;
import com.project.stylezone.repository.CatViewRepo;
import com.project.stylezone.repository.ColorRepo;
import com.project.stylezone.repository.ColorViewRepo;
import com.project.stylezone.repository.OccasionRepo;
import com.project.stylezone.repository.OccasionViewRepo;
import com.project.stylezone.repository.ProductDetailRepo;
import com.project.stylezone.repository.ProductDetailsFemaleRepo;
import com.project.stylezone.repository.ProductDetailsMaleRepo;
import com.project.stylezone.repository.ProductListViewRepo;
import com.project.stylezone.repository.ProductRepo;

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

	@Autowired
	CatRepo catRepo;

	@Autowired
	CatViewRepo catViewRepo;

	@Autowired
	ProductRepo productRepo;

	@Autowired
	ProductDetailRepo productDetailsRepo;

	@Autowired
	ProductDetailsMaleRepo productDetailsMaleRepo;

	@Autowired
	ProductDetailsFemaleRepo productDetailsFemaleRepo;
	
	@Autowired
	ProductListViewRepo productListViewRepo;
	

	public List<Brand> getAllBrands() {
		// TODO Auto-generated method stub
		// return (List<Brand>) brandRepo.findAll();

		return brandRepo.findAllBrandByLatestCreatedDate();
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

	public List<Color> getAllColors() {
		// TODO Auto-generated method stub
		return (List<Color>) colorRepo.findAllColorByLatestCreatedDate();
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

	public List<Category> getAllCat() {
		// TODO Auto-generated method stub
		return catRepo.findAllCatByLatestCreatedDate();
	}

	public Category saveOrUpdateCat(Category cat) {
		// TODO Auto-generated method stub
		return catRepo.save(cat);
	}

	public List<Category> removeCat(Category cat) {
		// TODO Auto-generated method stub
		catRepo.delete(cat);
		return (List<Category>) catRepo.findAll();
	}

	public Category fetchCatByName(String cat) {
		// TODO Auto-generated method stub
		return catRepo.findByCatName(cat);
	}

	public List<CategoryView> getAllCatwithCreatorName() {
		// TODO Auto-generated method stub
		return (List<CategoryView>) catViewRepo.findAll();
	}

	public Category fetchCatById(Category cat) {
		// TODO Auto-generated method stub
		return catRepo.findByCatId(cat.getCatId());
	}

	public Product saveOrUpdateProdct(Product product) {
		// TODO Auto-generated method stub
		return productRepo.save(product);
	}

	public ProductDetailsMaleAttr saveOrUpdateProdctMale(ProductDetailsMaleAttr productDetails) {
		// TODO Auto-generated method stub
		return productDetailsMaleRepo.save(productDetails);
	}

	public ProductDetailFemaleAttr saveOrUpdateProdctFemale(ProductDetailFemaleAttr productDetails) {
		// TODO Auto-generated method stub
		return productDetailsFemaleRepo.save(productDetails);
	}

	public boolean checkProductExists(Product product) {
		// TODO Auto-generated method stub
		List<ProductDetails> findProductDetailsByTitle = productDetailsRepo
				.findProductDetailsByTitle(product.getProductDetails().getProductTitle());
		if (findProductDetailsByTitle.size() == 0) {
			return false;
		} else {
			return true;
			/*List<Product> existsProduct = productRepo.isExistsProduct(product.getBrand(), product.getCategory(),
					product.getOccasion(), product.getColor(), product.getProductDetails());

			if (existsProduct.size() > 0) {
				return false;
			} else {
				return true;
			}*/

		}

	}

	public List<ProductListView> getAllProducts() {
		// TODO Auto-generated method stub
		return (List<ProductListView>) productListViewRepo.findAll();
	}

	public Product fetchAProduct(Integer productId) {
		// TODO Auto-generated method stub
		return productRepo.findOne(productId);
	}

	public ProductDetailsMaleAttr fetchMaleAttr(Integer maleId) {
		// TODO Auto-generated method stub
		ProductDetails details=new ProductDetails();
		details.setProductDetailsId(maleId);
		return productDetailsMaleRepo.findByProductDetails(details);
	}

	public ProductDetailFemaleAttr fetchFemale(Integer femaleId) {
		// TODO Auto-generated method stub
		ProductDetails details=new ProductDetails();
		details.setProductDetailsId(femaleId);
		return productDetailsFemaleRepo.findByProductDetails(details);
	}

	public ProductDetails fetchSingleProductDetails(Integer productDetailsId) {
		// TODO Auto-generated method stub
		return productDetailsRepo.findOne(productDetailsId);
	}

	public void removeMaleAttrById(Integer id) {
		// TODO Auto-generated method stub
		 productDetailsMaleRepo.delete(id);;
	}

	public void removeFemaleAttrById(Integer id) {
		// TODO Auto-generated method stub
		 productDetailsFemaleRepo.delete(id);
	}

	public void removeProductDts(Integer id) {
		// TODO Auto-generated method stub
		productDetailsRepo.delete(id);
	}

	public void removeProduct(Product product) {
		// TODO Auto-generated method stub
		productRepo.delete(product);
	}


}
