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
import com.project.stylezone.models.Category;
import com.project.stylezone.models.CategoryView;
import com.project.stylezone.models.Color;
import com.project.stylezone.models.ColorView;
import com.project.stylezone.models.Occasion;
import com.project.stylezone.models.OccasionView;
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

	
	/***
	 * Brands start
	 * @return
	 */
	
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

	

	/***
	 * Brands end
	 * @return
	 */
	
	
	

	/***
	 * color start
	 * @return
	 */
	
	@RequestMapping(value = "/adminpanel/color/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<ColorView>> getAllColor() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<ColorView> colorView = stockService.getAllColorswithCreatorName();

		if (colorView.size() > 0) {
			responseHeaders.add(AppConstant.message, "No Color Available");
		} else {
			responseHeaders.add(AppConstant.message, colorView.size() + " available in stock");
		}

		return new ResponseEntity<List<ColorView>>(colorView, responseHeaders, HttpStatus.OK);
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
	
	/***
	 * color end
	 * @return
	 */
	

	
	/***
	 * occasion start
	 * @return
	 */
	
	@RequestMapping(value = "/adminpanel/occasion/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<OccasionView>> getAllOccasions() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<OccasionView> allOccasions = stockService.getAllOccasionswithCreatorName();

		if (allOccasions.size() > 0) {
			responseHeaders.add(AppConstant.message, "No Brands Available");
		} else {
			responseHeaders.add(AppConstant.message, allOccasions.size() + " available in stock");
		}

		return new ResponseEntity<List<OccasionView>>(allOccasions, responseHeaders, HttpStatus.OK);
	}
	
	

	@RequestMapping(value = "/adminpanel/occasion/save", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> saveOrupdateOccasion(@RequestBody Occasion occasion) {
		final Integer occasionId = occasion.getOccasionId();

		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Occasion saveOrUpdateOccasion = null;
		if (stockService.fetchOccasionByName(occasion.getOccasionName().toLowerCase()) != null) {
			responseHeaders.set(AppConstant.message, "Occasion is already present");
		} else {
			occasion.setCreatedBy(userDetails.getUserId());
			occasion.setCreatedDate(AppConstant.getCurrentDateTime());
			saveOrUpdateOccasion = stockService.saveOrUpdateOccasion(occasion);
			if (saveOrUpdateOccasion == null)

				responseHeaders.set(AppConstant.message, "Data Base not available");

			else {
				if ((occasionId != null) && occasionId == saveOrUpdateOccasion.getOccasionId()) {
					responseHeaders.set(AppConstant.message, "Occasion updated");

				} else {
					responseHeaders.set(AppConstant.message, "Occasion created");
				}
			}

		}
		return AppConstant.convertToReponseEntity(saveOrUpdateOccasion, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/occasion/delete", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> deleteOccasion(@RequestBody Occasion occasion) {

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<Occasion> occasionList = null;
		
		if (stockService.fetchOccasiondById(occasion) != null) {
			occasionList = stockService.removeOccasion(occasion);
			responseHeaders.set(AppConstant.message, "Occasion Deleted");
		}else
		{
			responseHeaders.set(AppConstant.message, "No Occasion Found");
		}
		

		return AppConstant.convertToReponseEntity(occasionList, responseHeaders, HttpStatus.OK);
	}
	
	/***
	 * occasion end
	 * @return
	 */
	
	
	
	
	
	
	/***
	 * category start
	 * @return
	 */
	
	@RequestMapping(value = "/adminpanel/cat/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<CategoryView>> getAllCat() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<CategoryView> allcat = stockService.getAllCatwithCreatorName();

		if (allcat.size() > 0) {
			responseHeaders.add(AppConstant.message, "No Categories Available");
		} else {
			responseHeaders.add(AppConstant.message, allcat.size() + " available in stock");
		}

		return new ResponseEntity<List<CategoryView>>(allcat, responseHeaders, HttpStatus.OK);
	}
	
	

	@RequestMapping(value = "/adminpanel/cat/save", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> saveOrupdateCat(@RequestBody Category cat) {
		final Integer catId = cat.getCatId();

		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Category saveOrUpdateCat = null;
		if (stockService.fetchCatByName(cat.getCatName().toLowerCase()) != null) {
			responseHeaders.set(AppConstant.message, "Occasion is already present");
		} else {
			cat.setCreatedBy(userDetails.getUserId());
			cat.setCreatedDate(AppConstant.getCurrentDateTime());
			saveOrUpdateCat = stockService.saveOrUpdateCat(cat);
			if (saveOrUpdateCat == null)

				responseHeaders.set(AppConstant.message, "Data Base not available");

			else {
				if ((catId != null) && catId == saveOrUpdateCat.getCatId()) {
					responseHeaders.set(AppConstant.message, "Category updated");

				} else {
					responseHeaders.set(AppConstant.message, "Category created");
				}
			}

		}
		return AppConstant.convertToReponseEntity(saveOrUpdateCat, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/cat/delete", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> deleteCat(@RequestBody Category cat) {

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<Category> catList = null;
		
		if (stockService.fetchCatById(cat) != null) {
			catList = stockService.removeCat(cat);
			responseHeaders.set(AppConstant.message, "Category Deleted");
		}else
		{
			responseHeaders.set(AppConstant.message, "No Category Found");
		}
		

		return AppConstant.convertToReponseEntity(catList, responseHeaders, HttpStatus.OK);
	}
	
	/***
	 * category end
	 * @return
	 */
	
	
	
	
	
	
	private UserDetails getLoggedInUserDetails() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = userService.findUserDetailsByEmail("chiranjitjana@gmail.com");
		return userDetails;
	}

}
