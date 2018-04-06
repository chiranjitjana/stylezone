package com.project.stylezone.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.google.gson.Gson;
import com.project.stylezone.AppConstant;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.ProductDetailFemaleAttr;
import com.project.stylezone.models.ProductDetailsMaleAttr;
import com.project.stylezone.models.ProductListView;
import com.project.stylezone.models.ProductWrapper;
import com.project.stylezone.service.StocksService;
import com.project.stylezone.service.UserService;

@Controller
public class ProductController {

	@Value("${fileupload.path}")
	String filePath;
	
	@Autowired
	UserService userService;

	@Autowired
	StocksService stockService;

	@RequestMapping(value = "/adminpanel/product/create", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> createProduct(MultipartRequest request ,HttpServletRequest httpRequest) {
		
		System.out.println("Inside controller");
		System.out.println("Path "+filePath);
		
		String parameter = httpRequest.getParameter("data");
		
		
		
		
		Gson gson = new Gson();
		
		ProductWrapper localProductWrapper = gson.fromJson(parameter, ProductWrapper.class);
		System.out.println(parameter);
		
		
		Product product = localProductWrapper.getProduct();
		Product saveOrUpdateProdct = null;
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		if (!stockService.checkProductExists(product)) {

			product.setCreatedBy(28);
			product.setCreatedDate(new Date());
			MultipartFile avt1 = request.getFile("avt1");
			MultipartFile avt2 = request.getFile("avt2");
			MultipartFile avt3 = request.getFile("avt3");
			
			product.getProductDetails().setAvt1(filePath+avt1.getOriginalFilename());
			product.getProductDetails().setAvt2(filePath+avt2.getOriginalFilename());
			product.getProductDetails().setAvt3(filePath+avt3.getOriginalFilename());
			
			try {
				avt1.transferTo(new File(filePath+avt1.getOriginalFilename()));
				avt2.transferTo(new File(filePath+avt2.getOriginalFilename()));
				avt3.transferTo(new File(filePath+avt3.getOriginalFilename()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			saveOrUpdateProdct = stockService.saveOrUpdateProdct(product);
			if (saveOrUpdateProdct != null) {
				if (saveOrUpdateProdct.getProductDetails().getGender() == 'M') {

					ProductDetailsMaleAttr maleAttr = localProductWrapper.getProductDetailsMale();
					maleAttr.setProductDetails(saveOrUpdateProdct.getProductDetails());
					stockService.saveOrUpdateProdctMale(maleAttr);
					responseHeaders.add(AppConstant.message, "Product Created Successfull");
				} else {
					ProductDetailFemaleAttr femaleAttr = localProductWrapper.getProductDetailFemaleAttr();
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
	public @ResponseBody ResponseEntity<List<ProductListView>> getAllProducts() {
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

	@RequestMapping(value = "/adminpanel/product/fetch", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Product> getSingleProduct(@RequestParam(name="productId") String productId) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Product fetchAProduct = stockService.fetchAProduct(Integer.parseInt(productId));
		
		

		if (fetchAProduct== null) {
			responseHeaders.add(AppConstant.message, "Product Not found");
		} else {
			responseHeaders.add(AppConstant.message, "Product found");
		}

		return new ResponseEntity<Product>(fetchAProduct, responseHeaders, HttpStatus.OK);
	}
	
	
	@RequestMapping(value = "/adminpanel/productDtls/fetch", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> getProductDtlsAttr(@RequestParam(name="productDetailsId") Integer productDetailsId,@RequestParam(name="gender") String gender) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		
		Object object=null;
		if(gender.equals("M"))
		{
			object=stockService.fetchMaleAttr(productDetailsId);
		}else
		{
			object=stockService.fetchFemale(productDetailsId);
		}
			

		if (object== null) {
			responseHeaders.add(AppConstant.message, "Product Attribute Not Found");
		} else {
			responseHeaders.add(AppConstant.message, "Product Attribute  Found");
		}

		return new ResponseEntity<Object>(object, responseHeaders, HttpStatus.OK);
	}
	
	
	public <T> List<T> jsonArrayToObjectList(String json, Class<T> tClass) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		CollectionType listType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, tClass);
		List<T> ts = mapper.readValue(json, listType);
		return ts;
	}

}
