package com.project.stylezone.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.project.stylezone.models.OrderAddress;
import com.project.stylezone.models.OrderDetails;
import com.project.stylezone.models.OrderProduct;
import com.project.stylezone.models.OrderTracker;
import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.UserLoginInfo;
import com.project.stylezone.models.Users;
import com.project.stylezone.notification.EmailObject;
import com.project.stylezone.notification.EmailSenderObject;
import com.project.stylezone.notification.NotificationObjectFactory;
import com.project.stylezone.notification.NotificationType;
import com.project.stylezone.notification.NotificationTypeEnum;
import com.project.stylezone.notification.type.UserVerificationNotiType;
import com.project.stylezone.notification.type.objects.AccountVerificationObject;
import com.project.stylezone.service.OrdersService;
import com.project.stylezone.service.StocksService;
import com.project.stylezone.service.UserService;

@Controller
public class AdminBackendServiceController {

	@Autowired
	UserService userService;

	@Autowired
	StocksService stockService;

	@Autowired
	OrdersService ordersService;

	@RequestMapping(value = "/register/user", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> createUser(@RequestBody Users user) {
		UserDetails userDetails = userService.findUserDetailsByEmail(user.getUserEmail());
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Users saveUser = null;
		if (userDetails == null) {
			user.setAccStatus(0);
			saveUser = userService.saveUser(user);
			UserLoginInfo object = new UserLoginInfo();
			object.setUserId(saveUser.getUserId());
			object.setLastLogin(AppConstant.getCurrentDateTime());
			userService.saveUserLastLogin(object);
			// for admin
			if (saveUser.getUserRole().getRoleId() == 1) {
				responseHeaders.add(AppConstant.message, "Admin Created Successfully.Login to Open Account");
			} else if (saveUser.getUserRole().getRoleId() == 2) {
				NotifyUserAccountVerification(saveUser);

				responseHeaders.add(AppConstant.message, "User Created Successfully.Please your verify your email ID");
			} else {
				responseHeaders.add(AppConstant.message, "Unexpected User Regester type selected");

			}

		} else {
			responseHeaders.add(AppConstant.message, "User is Already present");
		}

		return AppConstant.convertToReponseEntity(saveUser, responseHeaders, HttpStatus.OK);

	}

	private void NotifyUserAccountVerification(Users saveUser) {
		NotificationType notificationObject = NotificationObjectFactory
				.getNotificationObject(NotificationTypeEnum.VERIFYACCOUNT);

		AccountVerificationObject accountVerificationObject = new AccountVerificationObject();
		accountVerificationObject
				.setHref(AppConstant.BASEURL + "activatedaccount?session=" + saveUser.getUserId());
		accountVerificationObject.setHrefName("Verify Account");
		accountVerificationObject
				.setMessageContent("In order to access your account please click on bellow link : -");
		accountVerificationObject.setTitle("Account Verification");

		EmailObject emailObject = new EmailObject();
		emailObject.setSubject("Verify Account");
		emailObject.setReceiver(saveUser.getUserEmail());
		emailObject.setHtmlEmailTemplate(notificationObject.getNotificationContent(accountVerificationObject));

		EmailSenderObject.sendEmail(emailObject);
	}

	@RequestMapping(value = "/user/getDetails", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> getUserByEmail() {
		UserDetails userDetails = getLoggedInUserDetails();
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		if (userDetails == null) {
			responseHeaders.add(AppConstant.message, "No user found");
		} else {
			if (userDetails.getLastLogin() == null) {
				userDetails.setLastLogin(AppConstant.getCurrentDateTime());
			}
			responseHeaders.add(AppConstant.message, "User found");
		}

		return AppConstant.convertToReponseEntity(userDetails, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/user/all/admin", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> getAllAdminUserListAccuntStatusInACTIVE() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		List<Users> allUsers = userService.findAllAdminUserByAccStatusInactive();

		if (allUsers == null) {
			responseHeaders.add(AppConstant.message, "No user found");
		} else {
			responseHeaders.add(AppConstant.message, allUsers.size() + " Number of admin request");
		}

		return AppConstant.convertToReponseEntity(allUsers, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/user/{action}/{userID}", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> updateAdminStatus(@PathVariable String userID,
			@PathVariable String action){
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Users user = userService.findUserByUserId(Integer.parseInt(userID));
		
		
		if(action.equals("accept")){
			user.setAccStatus(1);
			userService.saveUser(user);
			NotifyUserAccountVerification(user);
		}else if(action.equals("reject"))
		{
			userService.deleteUser(user);
		}
				
		return AppConstant.convertToReponseEntity(userService.findAllAdminUserByAccStatusInactive(), responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/saveUser", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> saveAdmin(@RequestBody Users user) {
		user.setAccStatus(1);
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
	 * 
	 * @return
	 */

	@RequestMapping(value = "/adminpanel/brand/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<BrandView>> getAllBrand() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<BrandView> allBrands = stockService.getAllBrandwithCreatorName();

		if (allBrands.size() <= 0) {
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
		} else {
			responseHeaders.set(AppConstant.message, "No Brand Found");
		}

		return AppConstant.convertToReponseEntity(allBrands, responseHeaders, HttpStatus.OK);
	}

	/***
	 * Brands end
	 * 
	 * @return
	 */

	/***
	 * color start
	 * 
	 * @return
	 */

	@RequestMapping(value = "/adminpanel/color/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<ColorView>> getAllColor() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<ColorView> colorView = stockService.getAllColorswithCreatorName();

		if (colorView.size() <= 0) {
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
		} else {
			responseHeaders.set(AppConstant.message, "No Color Found");
		}

		return AppConstant.convertToReponseEntity(colors, responseHeaders, HttpStatus.OK);
	}

	/***
	 * color end
	 * 
	 * @return
	 */

	/***
	 * occasion start
	 * 
	 * @return
	 */

	@RequestMapping(value = "/adminpanel/occasion/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<OccasionView>> getAllOccasions() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<OccasionView> allOccasions = stockService.getAllOccasionswithCreatorName();

		if (allOccasions.size() <= 0) {
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
		} else {
			responseHeaders.set(AppConstant.message, "No Occasion Found");
		}

		return AppConstant.convertToReponseEntity(occasionList, responseHeaders, HttpStatus.OK);
	}

	/***
	 * occasion end
	 * 
	 * @return
	 */

	/***
	 * category start
	 * 
	 * @return
	 */

	@RequestMapping(value = "/adminpanel/cat/all", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<List<CategoryView>> getAllCat() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<CategoryView> allcat = stockService.getAllCatwithCreatorName();

		if (allcat.size() <= 0) {
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
		} else {
			responseHeaders.set(AppConstant.message, "No Category Found");
		}

		return AppConstant.convertToReponseEntity(catList, responseHeaders, HttpStatus.OK);
	}

	/***
	 * category end
	 * 
	 * @return
	 */

	private UserDetails getLoggedInUserDetails() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = userService.findUserDetailsByEmail(auth.getName());
		return userDetails;
	}

	@RequestMapping(value = "/adminpanel/orders/fetchall", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> getAllOrders() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<Orders> orderList = ordersService.findAllOrdersNewToOld();

		if (orderList.size() <= 0) {
			responseHeaders.add(AppConstant.message, "No Order Available");
		} else {
			responseHeaders.add(AppConstant.message, orderList.size() + " order available");
		}

		return new ResponseEntity<Object>(orderList, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/orderDetails/{orderId}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> getAllOrders(@PathVariable String orderId) {

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Orders order = ordersService.findOrderByOrderID(orderId);
		OrderDetails orderDetails = new OrderDetails();
		if (order == null) {
			responseHeaders.add(AppConstant.message, "Order Not found");
		} else {
			responseHeaders.add(AppConstant.message, "Order Found");

			Users userDetails = userService.findUserByUserId(order.getUserId());
			OrderAddress address = ordersService.findOrderAddByOrderID(orderId);
			List<OrdersItem> orderItemList = ordersService.findOrderItemsByOrderID(orderId);

			List<OrderProduct> tempOrderProductList = new ArrayList<OrderProduct>();

			for (OrdersItem orderProduct : orderItemList) {
				OrderProduct ord = new OrderProduct();
				Product fetchAProduct = stockService.fetchAProduct(orderProduct.getProductId());
				if (orderProduct.getCustomFittingAppointmentDate() != null) {
					ord.setCustomFittingAppointmentDate(
							AppConstant.getFormatedDate(orderProduct.getCustomFittingAppointmentDate()));
				} else {
					ord.setCustomFittingAppointmentDate("Not Available");
				}

				ord.setDuration(orderProduct.getDuration());
				ord.setRentPrice(orderProduct.getRentPrice());
				ord.setDeposite(orderProduct.getDeposite());
				ord.setTotalPrice(orderProduct.getTotalPrice());
				ord.setStartDate(AppConstant.getFormatedDate(orderProduct.getStartDate()));
				ord.setEndDate(AppConstant.getFormatedDate(orderProduct.getEndDate()));
				ord.setProductTitle(fetchAProduct.getProductDetails().getProductTitle());
				ord.setProductAvt(fetchAProduct.getProductDetails().getAvt1());

				tempOrderProductList.add(ord);
			}

			List<OrderTracker> tracker = ordersService.fetchOrderTracker(orderId);

			orderDetails.setOrderId(order.getOrderId());
			orderDetails.setRentTotal(order.getRentTotal());
			orderDetails.setDepositeTotal(order.getDepositeTotal());
			orderDetails.setTotal(order.getTotal());
			orderDetails.setCreatedDate(order.getCreatedDate());
			orderDetails.setProductCount(orderItemList.size());

			orderDetails.setUsername(userDetails.getUserName());
			orderDetails.setUseremail(userDetails.getUserEmail());
			orderDetails.setUserphone(userDetails.getUserMobileNo());
			orderDetails.setAddress(address.getAddress());

			orderDetails.setTempOrderProductList(tempOrderProductList);
			orderDetails.setTracker(tracker);
		}

		return new ResponseEntity<Object>(orderDetails, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/orderTracker/{orderId}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> getOrderStatus(@PathVariable String orderId) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<OrderTracker> fetchOrderTracker = ordersService.fetchOrderTracker(orderId);
		if (fetchOrderTracker.size() > 0) {
			responseHeaders.add(AppConstant.message, "Tracker List Found");
		} else {
			responseHeaders.add(AppConstant.message, "Tracker List not Found");
		}

		return new ResponseEntity<Object>(fetchOrderTracker, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/adminpanel/orderTracker/save/{orderId}/{status}", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> getOrderStatus(@PathVariable String orderId, @PathVariable int status) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		OrderTracker tracker = new OrderTracker();
		tracker.setOrderId(orderId);
		tracker.setCreatedDate(AppConstant.getCurrentDateTimeDDMMYYY());
		tracker.setOrderStatus(status);
		ordersService.saveOrUpdateOrderTracker(tracker);
		List<OrderTracker> trackerList = ordersService.fetchOrderTracker(orderId);

		if (trackerList.size() > 0) {
			responseHeaders.add(AppConstant.message, "Tracker List Found");
		} else {
			responseHeaders.add(AppConstant.message, "Tracker List not Found");
		}
		return new ResponseEntity<Object>(trackerList, responseHeaders, HttpStatus.OK);
	}

}
