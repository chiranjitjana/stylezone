package com.project.stylezone.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
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
import com.project.stylezone.models.ProductDetails;
import com.project.stylezone.models.ProductDetailsMaleAttr;
import com.project.stylezone.models.ProductListView;
import com.project.stylezone.models.ProductWrapper;
import com.project.stylezone.service.StocksService;
import com.project.stylezone.service.UserService;

@Controller
public class ProductController {

	@Value("${fileupload.path}")
	String filePath;

	@Value("${filepath.src}")
	String fileSrc;

	@Autowired
	UserService userService;

	@Autowired
	StocksService stockService;

	@RequestMapping(value = "/adminpanel/product/create", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> createProduct(MultipartRequest request,
			HttpServletRequest httpRequest) {

		Gson gson = new Gson();

		ProductWrapper localProductWrapper = gson.fromJson(httpRequest.getParameter("data"), ProductWrapper.class);
		Product product = localProductWrapper.getProduct();
		Product saveOrUpdateProdct = null;
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		if (localProductWrapper.getProduct().getProductId() == 0) {
			if (!stockService.checkProductExists(product)) {

				saveOrUpdateProdct = saveOrUpdateMethod(request, localProductWrapper, product, responseHeaders,
						"Product Created");
			} else {
				responseHeaders.add(AppConstant.message, "Product Is Already Exists");
			}
		}

		else if (localProductWrapper.getProduct().getProductId() != 0) {
			saveOrUpdateProdct = saveOrUpdateMethod(request, localProductWrapper, product, responseHeaders,
					"Product Updated");
		}

		return AppConstant.convertToReponseEntity(saveOrUpdateProdct, responseHeaders, HttpStatus.OK);

	}

	private Product saveOrUpdateMethod(MultipartRequest request, ProductWrapper localProductWrapper, Product product,
			HttpHeaders responseHeaders, String message) {
		Product saveOrUpdateProdct;
		product.setCreatedBy(28);
		product.setCreatedDate(new Date());

		MultipartFile avt1 = request.getFile("avt1");
		MultipartFile avt2 = request.getFile("avt2");
		MultipartFile avt3 = request.getFile("avt3");
		String timestamp1 = AppConstant.getCurrentTimeInMs();
		String timestamp2 = AppConstant.getCurrentTimeInMs();
		String timestamp3 = AppConstant.getCurrentTimeInMs();

		setProductImages(product, avt1, avt2, avt3, timestamp1, timestamp2, timestamp3);

		saveOrUpdateProdct = stockService.saveOrUpdateProdct(product);
		if (saveOrUpdateProdct != null) {
			try {
				if (!avt1.isEmpty())
					avt1.transferTo(new File(filePath + getFileName(avt1, timestamp1)));
				if (!avt2.isEmpty())
					avt2.transferTo(new File(filePath + getFileName(avt2, timestamp2)));
				if (!avt3.isEmpty())
					avt3.transferTo(new File(filePath + getFileName(avt3, timestamp3)));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (saveOrUpdateProdct.getProductDetails().getGender() == 'M') {

				ProductDetailsMaleAttr maleAttr = localProductWrapper.getProductDetailsMale();
				maleAttr.setProductDetails(saveOrUpdateProdct.getProductDetails());
					
				
				stockService.saveOrUpdateProdctMale(maleAttr);
				responseHeaders.add(AppConstant.message, message);
			} else {
				ProductDetailFemaleAttr femaleAttr = localProductWrapper.getProductDetailFemaleAttr();
				femaleAttr.setProductDetails(saveOrUpdateProdct.getProductDetails());
				stockService.saveOrUpdateProdctFemale(femaleAttr);
				responseHeaders.add(AppConstant.message, message);
			}
		}

		else {
			responseHeaders.add(AppConstant.message, "Error occured while creating product");
		}
		return saveOrUpdateProdct;
	}

	private void setProductImages(Product product, MultipartFile avt1, MultipartFile avt2, MultipartFile avt3,
			String timestamp1, String timestamp2, String timestamp3) {
		ProductDetails fetchSingleProductDetails = stockService
				.fetchSingleProductDetails(product.getProductDetails().getProductDetailsId());

		if (!avt1.isEmpty()) {
			product.getProductDetails().setAvt1(fileSrc + getFileName(avt1, timestamp1));
		} else {
			product.getProductDetails().setAvt1(fetchSingleProductDetails.getAvt1());

		}

		if (!avt2.isEmpty()) {
			product.getProductDetails().setAvt2(fileSrc + getFileName(avt2, timestamp2));
		} else {
			product.getProductDetails().setAvt2(fetchSingleProductDetails.getAvt2());
		}

		if (!avt3.isEmpty()) {

			product.getProductDetails().setAvt3(fileSrc + getFileName(avt3, timestamp3));
		} else {
			product.getProductDetails().setAvt3(fetchSingleProductDetails.getAvt3());
		}
	}

	private String getFileName(MultipartFile originalFilename, String timems) {
		// TODO Auto-generated method stub

		String[] split = originalFilename.getOriginalFilename().split("\\.");
		String ext = split[split.length - 1];
		return timems + "." + ext;

	}

	@RequestMapping(value = "/adminpanel/product/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<ProductListView>> getAllProducts() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<ProductListView> allProducts = stockService.getAllProducts();

		if (allProducts.size() <= 0) {
			responseHeaders.add(AppConstant.message, "No Product Available");
		} else {

			for (ProductListView productListView : allProducts) {
				productListView.setGender(productListView.getGender().equals("M") ? "Men" : "Women");
				productListView.setInStock(productListView.getAvailability() == 1 ? "Yes" : "No");
				productListView.setCreateDateFormated(AppConstant.getFormatedDate(productListView.getCreateDate()));
			}
			responseHeaders.add(AppConstant.message, allProducts.size() + " Product available in stock");
		}

		return new ResponseEntity<List<ProductListView>>(allProducts, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/product/fetch", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Product> getSingleProduct(@RequestParam(name = "productId") String productId) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Product fetchAProduct = stockService.fetchAProduct(Integer.parseInt(productId));

		if (fetchAProduct == null) {
			responseHeaders.add(AppConstant.message, "Product Not found");
		} else {
			responseHeaders.add(AppConstant.message, "Product found");
		}

		return new ResponseEntity<Product>(fetchAProduct, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/productDtls/fetch", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> getProductDtlsAttr(
			@RequestParam(name = "productDetailsId") Integer productDetailsId,
			@RequestParam(name = "gender") String gender) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		Object object = null;
		if (gender.equals("M")) {
			object = stockService.fetchMaleAttr(productDetailsId);
		} else {
			object = stockService.fetchFemale(productDetailsId);
		}

		if (object == null) {
			responseHeaders.add(AppConstant.message, "Product Attribute Not Found");
		} else {
			responseHeaders.add(AppConstant.message, "Product Attribute  Found");
		}

		return new ResponseEntity<Object>(object, responseHeaders, HttpStatus.OK);
	}

	
	@RequestMapping(value = "/adminpanel/product/delete", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> deleteProduct(
			@RequestParam(name = "productDetailsId") Integer productDetailsId,
			@RequestParam(name = "gender") String gender,@RequestParam(name = "attrId") Integer attrId,
			@RequestParam(name = "productId") String productId) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		Object obj=null;
		return new ResponseEntity<Object>(obj, responseHeaders, HttpStatus.OK);
	}

	
}
