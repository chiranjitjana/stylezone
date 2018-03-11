package com.project.stylezone.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.stylezone.AppConstant;
import com.project.stylezone.models.Brand;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.Users;
import com.project.stylezone.service.StocksService;
import com.project.stylezone.service.UserService;

@Controller
public class AdminBackendServiceController {

	@Autowired
	UserService userService;

	@Autowired
	StocksService stockService;

	@RequestMapping(value = "/adminpanel/getAdminDetails", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> getUserByEmail() {
		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		if (userDetails == null) {
			responseHeaders.add(AppConstant.message, "No user found");
		} else {
			responseHeaders.add(AppConstant.message, "User found");
		}

		return AppConstant.convertToReponseEntity(userDetails, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/saveAdminuser", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object>  saveAdmin(@RequestBody Users user) {
		Users saveUser = userService.saveUser(user);
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		UserDetails userDetails = userService.findUserDetailsByEmail(saveUser.getUserEmail());
		if (userDetails == null) {
			responseHeaders.add(AppConstant.message, "No user found");
		} else {
			responseHeaders.add(AppConstant.message, "User Updated");
		}
		
		return AppConstant.convertToReponseEntity(userDetails, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/brand/all")
	public @ResponseBody ResponseEntity<List<Brand>> getAllBrand() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<Brand> allBrands = stockService.getAllBrands();

		if (allBrands.size() > 0) {
			responseHeaders.add(AppConstant.message, "No Brands Available");
		} else {
			responseHeaders.add(AppConstant.message, allBrands.size() + " available in stock");
		}

		return new ResponseEntity<List<Brand>>(allBrands, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/brand/save")
	public @ResponseBody ResponseEntity<Object> saveOrupdateBrand(@RequestBody Brand brand) {
		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Brand saveOrUpdateBrand = null;
		if (stockService.fetchBrandByName(brand.getBrandName().toLowerCase()) != null) {
			responseHeaders.set(AppConstant.message, "Brand is already present");
		} else {
			brand.setCreatedBy(userDetails.getUserId());
			brand.setCreatedDate(AppConstant.getCurrentDateTime());
			saveOrUpdateBrand = stockService.saveOrUpdateBrand(brand);
			if (saveOrUpdateBrand == null)
				responseHeaders.set(AppConstant.message, "Data Base not available");
			else
				responseHeaders.set(AppConstant.message, "Brand created");
		}

		return AppConstant.convertToReponseEntity(saveOrUpdateBrand, responseHeaders, HttpStatus.OK);
	}

	private UserDetails getLoggedInUserDetails() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = userService.findUserDetailsByEmail("chiranjitjana@gmail.com");
		return userDetails;
	}

}
