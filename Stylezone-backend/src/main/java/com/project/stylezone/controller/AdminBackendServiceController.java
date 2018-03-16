package com.project.stylezone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
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
import com.project.stylezone.models.BrandView;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.ColorView;
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
	public @ResponseBody ResponseEntity<Object> saveAdmin(@RequestBody Users user) {
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

	@RequestMapping(value = "/adminpanel/brand/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<BrandView>> getAllBrand() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<BrandView> allBrands = stockService.getAllBrandwithCreatorName();

		if (allBrands.size() > 0) {
			responseHeaders.add(AppConstant.message, "No Brands Available");
		} else {
			responseHeaders.add(AppConstant.message, allBrands.size() + " available in stock");
		}

		return new ResponseEntity<List<BrandView>>(allBrands, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/brand/save", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> saveOrupdateBrand(@RequestBody Brand brand) {
		final Integer brandId = brand.getBrandId();

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

			else {
				if ((brandId != null) && brandId == saveOrUpdateBrand.getBrandId()) {
					responseHeaders.set(AppConstant.message, "Brand updated");

				} else {
					responseHeaders.set(AppConstant.message, "Brand created");
				}
			}

		}
		return AppConstant.convertToReponseEntity(saveOrUpdateBrand, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/brand/delete", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> deleteBrand(@RequestBody Brand brand) {

		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<Brand> allBrands = null;
		
		if (stockService.fetchBrandById(brand) != null) {
			allBrands = stockService.removeBrand(brand);
			responseHeaders.set(AppConstant.message, "Brand Deleted");
		}else
		{
			responseHeaders.set(AppConstant.message, "No Brand Found");
		}
		

		return AppConstant.convertToReponseEntity(allBrands, responseHeaders, HttpStatus.OK);
	}

	
	@RequestMapping(value = "/adminpanel/color/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<ColorView>> getAllColor() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<ColorView> allColors = stockService.getAllColorswithCreatorName();

		if (allColors.size() > 0) {
			responseHeaders.add(AppConstant.message, "No Brands Available");
		} else {
			responseHeaders.add(AppConstant.message, allColors.size() + " available in stock");
		}

		return new ResponseEntity<List<ColorView>>(allColors, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/color/save", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> saveOrupdateColor(@RequestBody Color color) {
		final Integer colorId = color.getColorId();

		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Color saveOrUpdateColor = null;
		if (stockService.fetchBrandByName(color.getColorName().toLowerCase()) != null) {
			responseHeaders.set(AppConstant.message, "Color is already present");
		} else {
			color.setCreatedBy(userDetails.getUserId());
			color.setCreatedDate(AppConstant.getCurrentDateTime());
			saveOrUpdateColor = stockService.saveOrUpdateColor(color);
			if (saveOrUpdateColor == null)

				responseHeaders.set(AppConstant.message, "Data Base not available");

			else {
				if ((colorId != null) && colorId == saveOrUpdateColor.getColorId()) {
					responseHeaders.set(AppConstant.message, "Color updated");

				} else {
					responseHeaders.set(AppConstant.message, "Color created");
				}
			}

		}
		return AppConstant.convertToReponseEntity(saveOrUpdateColor, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/color/delete", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> deleteColor(@RequestBody Color color) {

		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<Color> colors = null;
		
		if (stockService.fetchColordById(color) != null) {
			colors = stockService.removeBrand(color);
			responseHeaders.set(AppConstant.message, "Color Deleted");
		}else
		{
			responseHeaders.set(AppConstant.message, "No Color Found");
		}
		

		return AppConstant.convertToReponseEntity(colors, responseHeaders, HttpStatus.OK);
	}
	
	

	
	
	private UserDetails getLoggedInUserDetails() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = userService.findUserDetailsByEmail("chiranjitjana@gmail.com");
		return userDetails;
	}

}
