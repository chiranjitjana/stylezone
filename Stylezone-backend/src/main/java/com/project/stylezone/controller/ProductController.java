package com.project.stylezone.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.google.gson.Gson;
import com.project.stylezone.AppConstant;
import com.project.stylezone.models.BrandView;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.ProductDetailFemaleAttr;
import com.project.stylezone.models.ProductDetailsMaleAttr;
import com.project.stylezone.models.ProductListView;
import com.project.stylezone.models.ProductWrapper;
import com.project.stylezone.service.StocksService;
import com.project.stylezone.service.UserService;

@Controller
public class ProductController {

	@Autowired
	UserService userService;

	@Autowired
	StocksService stockService;

	@RequestMapping(value = "/adminpanel/product/create", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> createProduct(@RequestBody ProductWrapper productWrapper) {

		Product product = productWrapper.getProduct();
		Product saveOrUpdateProdct = null;
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		if (!stockService.checkProductExists(product)) {

			product.setCreatedBy(28);
			product.setCreatedDate(new Date());

			saveOrUpdateProdct = stockService.saveOrUpdateProdct(product);
			if (saveOrUpdateProdct != null) {
				if (saveOrUpdateProdct.getProductDetails().getGender() == 'M') {

					ProductDetailsMaleAttr maleAttr = productWrapper.getProductDetailsMale();
					maleAttr.setProductDetails(saveOrUpdateProdct.getProductDetails());
					stockService.saveOrUpdateProdctMale(maleAttr);
					responseHeaders.add(AppConstant.message, "Product Created Successfull");
				} else {
					ProductDetailFemaleAttr femaleAttr = productWrapper.getProductDetailFemaleAttr();
					femaleAttr.setProductDetails(saveOrUpdateProdct.getProductDetails());
					stockService.saveOrUpdateProdctFemale(femaleAttr);
					responseHeaders.add(AppConstant.message, "Product Created Successfull");
				}
			} else {
				responseHeaders.add(AppConstant.message, "Error occured while creating product");
			}
		} else {
			responseHeaders.add(AppConstant.message, "Product Is Already Exists");
		}

		return AppConstant.convertToReponseEntity(saveOrUpdateProdct, responseHeaders, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/adminpanel/product/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<ProductListView>> getAllBrand() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<ProductListView> allProducts = stockService.getAllProducts();
		
		

		if (allProducts.size()<= 0) {
			responseHeaders.add(AppConstant.message, "No Product Available");
		} else {
			
			for (ProductListView productListView : allProducts) {
				productListView.setGender(productListView.getGender().equals("M")?"Men":"Women");
				productListView.setInStock(productListView.getAvailability()==1?"Yes":"No");
				productListView.setCreateDateFormated(AppConstant.getFormatedDate( productListView.getCreateDate()));
			}
			responseHeaders.add(AppConstant.message, allProducts.size() + " Product available in stock");
		}

		return new ResponseEntity<List<ProductListView>>(allProducts, responseHeaders, HttpStatus.OK);
	}

	public <T> List<T> jsonArrayToObjectList(String json, Class<T> tClass) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		CollectionType listType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, tClass);
		List<T> ts = mapper.readValue(json, listType);
		return ts;
	}

}
