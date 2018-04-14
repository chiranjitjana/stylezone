package com.project.stylezone.controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.stylezone.AppConstant;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.ProductWrapper;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;
import com.project.stylezone.service.StocksService;
import com.project.stylezone.service.UserService;

@Controller
public class UIController {

	@Autowired
	UserService userService;
	
	@Autowired
	StocksService stockService;

	@RequestMapping(value = "/index")
	public String getHome() {
		return "/userpanel/index";
	}

	@RequestMapping(value = "/userlogin")
	public String getUserLogin() {
		return "/userpanel/login";
	}

	@RequestMapping(value = "/adminpanel")
	public String getAdminLoginPage() {
		return "/adminpanel/dashboard";
	}

	@RequestMapping(value = "/cart")
	public String getCart() {
		return "/userpanel/cart";
	}

	@RequestMapping(value = "/contactus")
	public String getContactUs() {
		return "/userpanel/contact-us";
	}

	@RequestMapping(value = "/myaccount")
	public String getMyAccount() {
		return "/userpanel/useraccount";
	}

	@RequestMapping(value = "/getProducts/{type}/{typeid}", method = RequestMethod.GET)
	public ModelAndView getProductsCat(@PathVariable String type,@PathVariable String typeid) {
		ModelAndView model = new ModelAndView();
		
		List<ProductWrapper> wrapper = new ArrayList<ProductWrapper>();
		getWantedProductList(wrapper);
		List<ProductWrapper> extractedList=null;
		try {
			extractedList = extractThePassType(wrapper,type,typeid);
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.setViewName("/userpanel/productlist");
		model.addObject("productlist", extractedList);
		
		return model;

	}
	
	
	@RequestMapping(value = "/getProducts/show/{typeid}", method = RequestMethod.GET)
	public ModelAndView getProductsDetails(@PathVariable String typeid) {
		ModelAndView model = new ModelAndView();
	
		Product fetchAProduct = stockService.fetchAProduct(Integer.parseInt(typeid));
		ProductWrapper wrapper=new ProductWrapper();
		wrapper.setProduct(fetchAProduct);
		
		if(fetchAProduct.getProductDetails().getGender()=='M')
		{
			wrapper.setProductDetailsMale(stockService.fetchMaleAttr(fetchAProduct.getProductDetails().getProductDetailsId()));
		}else
		{
			wrapper.setProductDetailFemaleAttr(stockService.fetchFemale(fetchAProduct.getProductDetails().getProductDetailsId()));
		}
		
		
		
		
	
		model.setViewName("/userpanel/product-details");
		model.addObject("product", wrapper);
		
		return model;

	}
	

	private List<ProductWrapper> extractThePassType(List<ProductWrapper> wrapper, String type, String typeid) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		// TODO Auto-generated method stub
		HashSet<ProductWrapper> set=new HashSet<ProductWrapper>();
		
		for (ProductWrapper productWrapper : wrapper) {
			Product product = productWrapper.getProduct();
			
			Method method = product.getClass().getMethod("get"+type, null);
			Object invoke = method.invoke(product, null);
			
			Object value=null;
			if(type.equals("Category"))
			{
				Method idMethods = invoke.getClass().getMethod("getCatId", null);
				value=idMethods.invoke(invoke, null);
			}
			
			if(type.equals("Brand"))
			{
				Method idMethods = invoke.getClass().getMethod("getBrandId", null);
				value=idMethods.invoke(invoke, null);
			}
			
			
			if(type.equals("Occasion"))
			{
				Method idMethods = invoke.getClass().getMethod("getOccasionId", null);
				value=idMethods.invoke(invoke, null);
			}
			
			if(type.equals("Color"))
			{
				Method idMethods = invoke.getClass().getMethod("getColorId", null);
				value=idMethods.invoke(invoke, null);
			}
			
			if(Integer.parseInt(value.toString())==Integer.parseInt(typeid))
			{
				set.add(productWrapper);
			}
			
			
		}
		
		
		return new ArrayList <ProductWrapper> (set); 
	}

	private void getWantedProductList(List<ProductWrapper> wrapper) {
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
	}

	@RequestMapping(value = "/activatedaccount", method = RequestMethod.GET)
	public ModelAndView activateAccount(@RequestParam(value = "session", required = false) Integer id,
			HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		Users user = userService.findUserByUserId(id);
		user.setAccStatus(1);
		userService.saveUser(user);
		model.addObject("activeactive", "Congratulations Your acount Now has been activated.");
		model.setViewName("/userpanel/login");
		return model;
	}

	@RequestMapping(value = "/loginprocess", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "notApproved", required = false) String notApproved,
			@RequestParam(value = "duplicateSessionObject", required = false) String duplicateSessionObject,
			@RequestParam(value = "accessDenied", required = false) String accessdenided,
			@RequestParam(value = "accountnotactivate", required = false) String accountnotactivate,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (notApproved != null) {
			model.addObject("notApproved", "You are not authorised to login!");
		}

		if (duplicateSessionObject != null) {
			model.addObject("duplicateSessionObject", "You are already logged in another session");
		}

		if (accessdenided != null) {
			model.addObject("accessdenided", "You not have correct Credentials to access this page");
		}

		if (accountnotactivate != null) {
			model.addObject("accountnotactivate",
					"Your email ID not verified .Please verify it in order to compelete signup process");
		}

		model.setViewName("/userpanel/login");
		return model;

	}

	@RequestMapping(value = "/logout")
	public String LogOut(HttpServletRequest request, HttpServletResponse response) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			updateLastLoginTime(auth);
		}
		return "redirect:/userlogin";
	}

	private void updateLastLoginTime(Authentication auth) {
		UserDetails userDetails = userService.findUserDetailsByEmail(auth.getName());
		UserLoginInfo userLoginInfo = new UserLoginInfo();
		userLoginInfo.setUserId(userDetails.getUserId());
		userLoginInfo.setLastLogin(AppConstant.getCurrentDateTime());
		userService.saveUserLastLogin(userLoginInfo);
	}

}
