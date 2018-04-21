package com.project.stylezone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.stylezone.AppConstant;
import com.project.stylezone.SessionController;
import com.project.stylezone.models.Brand;
import com.project.stylezone.models.Category;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.Occasion;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.ProductListView;
import com.project.stylezone.models.ProductWrapper;
import com.project.stylezone.models.SessionCart;
import com.project.stylezone.models.SessionProduct;
import com.project.stylezone.service.StocksService;

@Controller
public class WebSiteUIDataController {

	@Autowired
	StocksService stockService;

	@RequestMapping(value = "/getMenu", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> getWomenMenu(@RequestParam(name = "gender") String type) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		HashSet<ProductListView> pl = new HashSet<ProductListView>();

		HashSet<Brand> brandhashMap = new HashSet<Brand>();

		HashSet<Color> colorhashMap = new HashSet<Color>();

		HashSet<Occasion> occasionhashMap = new HashSet<Occasion>();
		HashSet<Category> categoryhashMap = new HashSet<Category>();

		HashMap<String, List<?>> menuList = new HashMap<String, List<?>>();
		List<ProductListView> allProducts = stockService.getAllProducts();

		for (ProductListView productListView : allProducts) {
			if (productListView.getGender().equals(type)) {
				pl.add(productListView);
			}
		}

		for (ProductListView productListView : pl) {
			Brand brand = new Brand();
			brand.setBrandId(productListView.getBrand());
			brandhashMap.add(stockService.fetchBrandById(brand));

			Color color = new Color();
			color.setColorId(productListView.getColor());
			colorhashMap.add(stockService.fetchColordById(color));

			Occasion occasion = new Occasion();
			occasion.setOccasionId(productListView.getOccasion());
			occasionhashMap.add(stockService.fetchOccasiondById(occasion));

			Category category = new Category();
			category.setCatId(productListView.getCategory());
			categoryhashMap.add(stockService.fetchCatById(category));

		}

		menuList.put("brandList", new ArrayList<Brand>(brandhashMap));
		menuList.put("colorList", new ArrayList<Color>(colorhashMap));
		menuList.put("occasionList", new ArrayList<Occasion>(occasionhashMap));
		menuList.put("categoryList", new ArrayList<Category>(categoryhashMap));

		return new ResponseEntity<Object>(menuList, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/getProductList", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> getHomePageist() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		List<ProductWrapper> wrapper = new ArrayList<ProductWrapper>();

		List<Product> fetchAllProductByIDDesc = stockService.fetchAllProductByIDDesc();

		for (Product product : fetchAllProductByIDDesc) {
			ProductWrapper productWr = new ProductWrapper();
			if (product.getProductDetails().getGender() == 'M') {
				productWr.setProductDetailsMale(
						stockService.fetchMaleAttr(product.getProductDetails().getProductDetailsId()));

			} else {
				productWr.setProductDetailFemaleAttr(
						stockService.fetchFemale(product.getProductDetails().getProductDetailsId()));
			}

			productWr.setProduct(product);
			wrapper.add(productWr);
		}

		return new ResponseEntity<Object>(wrapper, responseHeaders, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> addProductToCart(@RequestBody SessionProduct product,HttpServletRequest httpRequest) {
		boolean addSessionProduct = SessionController.addSessionProduct(product, httpRequest);
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		
		if(addSessionProduct==true) {
			responseHeaders.add(AppConstant.message, "Product Added to Cart");
		}
		else
		{
			responseHeaders.add(AppConstant.message, "Product Already Present in Cart");
		}
		Object object=SessionController.getProductList(httpRequest);
		return new ResponseEntity<Object>(object, responseHeaders, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/fetchCart", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> fetchProductToCart(HttpServletRequest httpRequest) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Object object=SessionController.getProductList(httpRequest);
		return new ResponseEntity<Object>(object, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/removeFromCart", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> removeFromCart(@RequestParam(name = "productID") Integer porductID,HttpServletRequest httpRequest) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<SessionProduct> productList = SessionController.getProductList(httpRequest);
		Object object = SessionController.removeProduct(porductID,httpRequest);
		responseHeaders.add(AppConstant.message, "Product Removed from cart");

		return new ResponseEntity<Object>(object, responseHeaders, HttpStatus.OK);
	}
	
	
	
}
