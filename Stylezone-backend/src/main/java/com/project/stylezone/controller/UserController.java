package com.project.stylezone.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.stylezone.AppConstant;

import com.project.stylezone.SessionController;
import com.project.stylezone.models.Address;
import com.project.stylezone.models.AppointmentList;
import com.project.stylezone.models.CardDetails;
import com.project.stylezone.models.CheckoutContainer;
import com.project.stylezone.models.CustomFittingAppointMent;
import com.project.stylezone.models.OTP;
import com.project.stylezone.models.OrderAddress;
import com.project.stylezone.models.OrderDetails;
import com.project.stylezone.models.OrderProduct;
import com.project.stylezone.models.OrderTracker;
import com.project.stylezone.models.Orders;
import com.project.stylezone.models.OrdersItem;
import com.project.stylezone.models.Product;
import com.project.stylezone.models.SessionCart;
import com.project.stylezone.models.SessionProduct;
import com.project.stylezone.models.UserDetails;
import com.project.stylezone.models.Users;
import com.project.stylezone.notification.EmailObject;
import com.project.stylezone.notification.EmailSenderObject;
import com.project.stylezone.notification.NotificationObjectFactory;
import com.project.stylezone.notification.NotificationType;
import com.project.stylezone.notification.NotificationTypeEnum;
import com.project.stylezone.notification.type.objects.ForgotPasswordObject;
import com.project.stylezone.service.OrdersService;
import com.project.stylezone.service.StocksService;
import com.project.stylezone.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	OrdersService ordersService;
	
	@Autowired
	StocksService stockService;

	@RequestMapping(value = "/user/forgotPassword", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> sendOTP(@RequestBody OTP otp) {
		Users userDetails = userService.findUserByUserEmail(otp.getUser().getUserEmail());

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		if (userDetails != null) {
			OTP otpFounded = userService.findOTPByUser(userDetails);
			if (otpFounded != null)
				userService.deleteOTPforUser(otpFounded);

			otp.setOtp(AppConstant.getOTP());
			otp.setExpiryDate(AppConstant.getEpiryTime());
			otp.setUser(userDetails);
			otp.setCreatedDate(AppConstant.getDateTime());

			OTP saveOTP = userService.saveOTP(otp);

			NotificationType notificationObject = NotificationObjectFactory
					.getNotificationObject(NotificationTypeEnum.FORGOTEPASSWORD);

			ForgotPasswordObject forgotPass = new ForgotPasswordObject();
			forgotPass.setMessageContent("OTP will be valid till 10 min");
			forgotPass.setTitle("Forgot Password OTP");
			forgotPass.setOTP(saveOTP.getOtp());

			EmailObject emailObject = new EmailObject();
			emailObject.setSubject("Forgot Password OTP");
			emailObject.setReceiver(userDetails.getUserEmail());
			emailObject.setHtmlEmailTemplate(notificationObject.getNotificationContent(forgotPass));

			EmailSenderObject.sendEmail(emailObject);

			responseHeaders.add(AppConstant.message, "OTP sent to your Email ID");

		} else {
			responseHeaders.add(AppConstant.message, "Sorry Email ID NOT Found");
		}

		return AppConstant.convertToReponseEntity(null, responseHeaders, HttpStatus.OK);

	}

	@RequestMapping(value = "/user/verifyForgotPassOtp", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> verifyOTP(@RequestParam(name = "email") String email,
			@RequestParam(name = "otp") String otp) {
		Users userDetails = userService.findUserByUserEmail(email);
		OTP findedOtp = userService.findOTPByUser(userDetails);

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Date expiryDate = findedOtp.getExpiryDate();

		boolean after = new Date().after(expiryDate);

		if (after) {
			responseHeaders.add(AppConstant.message, "OTP is expired");
			if (userService.findOTPByUser(userDetails) != null)
				userService.deleteOTPforUser(findedOtp);

		} else {
			if (otp.equals(findedOtp.getOtp())) {
				responseHeaders.add(AppConstant.message, "OTP matched");
				if (userService.findOTPByUser(userDetails) != null)
					userService.deleteOTPforUser(findedOtp);
			} else {
				responseHeaders.add(AppConstant.message, "OTP is not matched");
			}
		}

		return AppConstant.convertToReponseEntity(null, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/changePassword", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> changePassword(@RequestParam(name = "email") String email,
			@RequestParam(name = "password") String password) {
		Users userDetails = userService.findUserByUserEmail(email);
		userDetails.setPassword(password);
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		if (userService.saveUser(userDetails) != null) {
			responseHeaders.add(AppConstant.message, "Password Changed .Login with new password");

		} else {
			responseHeaders.add(AppConstant.message, "Unexpected Error Occored");
		}

		return AppConstant.convertToReponseEntity(null, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/save/adddress", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> saveAddress(@RequestBody Address address) {
		address.setUserId(getLoggedInUserDetails().getUserId());
		address.setCreatedDate(AppConstant.getCurrentDateTime());
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		Address saveAddress = userService.saveAddress(address);
		if (saveAddress != null) {
			responseHeaders.add(AppConstant.message, "Address Created");

		} else {
			responseHeaders.add(AppConstant.message, "Unexpected Error Occored");
		}

		return AppConstant.convertToReponseEntity(saveAddress, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/fetch/address", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> fetchAllMyAddress() {

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<Address> addList = userService.fetchAllAddress(getLoggedInUserDetails().getUserId());
		if (addList.size() <= 0) {
			responseHeaders.add(AppConstant.message, "No Address Available");
		} else {
			responseHeaders.add(AppConstant.message, addList.size() + " available in stock");
		}
		return AppConstant.convertToReponseEntity(addList, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/delete/address", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> deleteAddress(@RequestParam(name = "addId") Integer addId) {

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		userService.deleteAdrress(addId);

		List<Address> addList = userService.fetchAllAddress(getLoggedInUserDetails().getUserId());
		if (addList.size() <= 0) {
			responseHeaders.add(AppConstant.message, "No Address Available");
		} else {
			responseHeaders.add(AppConstant.message, addList.size() + " address available");
		}

		return AppConstant.convertToReponseEntity(addList, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/update/appointmentdate", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> deleteAddress(@RequestBody AppointmentList appList,
			HttpServletRequest httpRequest) {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		Object obj = new Object();
		List<Integer> productIds = new ArrayList<Integer>();

		if (appList.getAppointmentList().size() > 0) {
			SessionCart cart = SessionController.getCart(httpRequest);
			boolean setFlag = false;

			List<CustomFittingAppointMent> appointmentList = appList.getAppointmentList();
			for (CustomFittingAppointMent customFittingAppointMent : appointmentList) {
				for (SessionProduct sessionProduct : cart.getProducts()) {
					if (sessionProduct.getProductId() == customFittingAppointMent.getProductId()) {
						if (checkDeliveryDateAndCustomFittingDateDifference(customFittingAppointMent, sessionProduct)) {
							sessionProduct
									.setCustomFittingAppointmentDate(customFittingAppointMent.getAppointMentDate());
						} else {
							productIds.add(customFittingAppointMent.getProductId());
							if (setFlag == false) {
								responseHeaders.add(AppConstant.message, "Product Appointment Dates are not available");
								setFlag = true;
							}
						}

					}

				}

			}

			SessionController.updateCartProductAppointmentDate(cart, httpRequest);
		}

		return AppConstant.convertToReponseEntity(productIds, responseHeaders, HttpStatus.OK);
	}

	private boolean checkDeliveryDateAndCustomFittingDateDifference(CustomFittingAppointMent customFittingAppointMent,
			SessionProduct sessionProduct) {

		Date productRentStart = AppConstant.getFormatedDateDDMMYY(sessionProduct.getStartDate());
		Date appointMentDate = AppConstant.getDateFromStringDDMMYY(customFittingAppointMent.getAppointMentDate());

		long difference = productRentStart.getTime() - appointMentDate.getTime();
		float daysBetween = (difference / (1000 * 60 * 60 * 24));
		/*
		 * You can also convert the milliseconds to days using this method float
		 * daysBetween = TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
		 */

		if (daysBetween < 1) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping(value = "/user/paynow", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> payNow(@RequestBody CheckoutContainer container,
			HttpServletRequest httpRequest) {

		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		List<SessionProduct> products = ((SessionCart) SessionController.getCart(httpRequest)).getProducts();

		List<OrdersItem> orderItemList = new ArrayList<OrdersItem>();

		String uniqueUUID = AppConstant.getUniqueUUID();
		Orders order = new Orders();
		order.setOrderId(uniqueUUID);
		order.setCreatedDate(AppConstant.getCurrentDateTime());
		order.setUserId(getLoggedInUserDetails().getUserId());
		long rentPrice = 0;
		long desposite = 0;
		long total = 0;
		for (SessionProduct sessionProduct : products) {

			rentPrice += sessionProduct.getRentPrice();
			desposite += sessionProduct.getDeposite();

			OrdersItem item = new OrdersItem();

			item.setOrderId(uniqueUUID);
			item.setProductId(sessionProduct.getProductId());

			item.setDuration(sessionProduct.getDuration());
			item.setCustomFitting(sessionProduct.getCustomFitting());

			if (sessionProduct.getCustomFittingAppointmentDate() != null) {
				item.setCustomFittingAppointmentDate(
						AppConstant.getDateFromStringDDMMYY(sessionProduct.getCustomFittingAppointmentDate()));
			}
			item.setStartDate(sessionProduct.getStartDate());
			item.setEndDate(getEndDate(sessionProduct));
			item.setRentPrice(sessionProduct.getRentPrice());
			item.setDeposite(sessionProduct.getDeposite());
			item.setTotalPrice(sessionProduct.getTotalPrice());
			orderItemList.add(item);
		}
		total = rentPrice + desposite;
		order.setRentTotal(rentPrice);
		order.setDepositeTotal(desposite);
		order.setTotal(total);

		// save Order Items
		List<OrdersItem> saveOrderItems = ordersService.saveOrderItems(orderItemList);
		// saving orders
		Orders saveOrder = ordersService.saveOrder(order);

		OrderAddress address = container.getAddress();
		address.setOrderId(saveOrder.getOrderId());
		ordersService.saveOrderAddress(address);

		CardDetails cardDetails = container.getCardDetails();
		cardDetails.setOrderId(saveOrder.getOrderId());
		ordersService.saveCardDetailsforOrder(cardDetails);

		OrderTracker tracker = new OrderTracker();
		tracker.setOrderId(saveOrder.getOrderId());
		tracker.setOrderStatus(1);
		tracker.setCreatedDate(AppConstant.getCurrentDateTime());
		ordersService.saveOrUpdateOrderTracker(tracker);

		responseHeaders.add(AppConstant.message, saveOrderItems.size() + " products purchased done");

		// send Email Notification
		 SendPurchaseNotification(saveOrder);

		SessionController.reInintCart(httpRequest);
		return AppConstant.convertToReponseEntity(saveOrder, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/user/orderDetails/{orderId}", method = RequestMethod.GET)
	public ModelAndView getOrderDetails(@PathVariable String orderId) {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("/userpanel/order_details");

		Orders order = ordersService.findOrderByOrderID(orderId);
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
			}
			else
			{
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

		OrderDetails orderDetails = new OrderDetails();
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

		modelView.addObject("orderDetails", orderDetails);
		modelView.addObject("orderProductList", tempOrderProductList);
		modelView.addObject("orderTracker", tracker);
		return modelView;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/user/fetch/orderList", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> fetchOrderListByLoginUserid() {
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();
		
		List<Orders> allOrders = ordersService.findAllOrdersByUserId(getLoggedInUserDetails().getUserId());
		
		if(allOrders.size()>0) {
			responseHeaders.set(AppConstant.message,allOrders.size()+" Number Of Orders Available" );
		}else
		{
			responseHeaders.set(AppConstant.message,"No order found" );
		}
		
		
		return AppConstant.convertToReponseEntity(allOrders, responseHeaders, HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	private void SendPurchaseNotification(Orders saveOrder) {
		EmailObject object=new EmailObject();
		object.setReceiver(userService.findUserByUserId(saveOrder.getUserId()).getUserEmail());
		object.setSubject("Order Details");
		List<OrdersItem> findOrderItemsByOrderID = ordersService.findOrderItemsByOrderID(saveOrder.getOrderId());
		Users findUserByUserId = userService.findUserByUserId(saveOrder.getUserId());
		
		object.setHtmlEmailTemplate("<H4>StyleZon.com</h4><br>Your Order has been placed Successfully <br/> Total Order Amount (Including deposit +Rent) :"+saveOrder.getTotal()+"<br/> Thank you to chooes Stylezone.com" );
		
		EmailSenderObject.sendEmail(object);
	}

	private Date getEndDate(SessionProduct sessionProduct) {
		Calendar c = Calendar.getInstance();
		c.setTime(sessionProduct.getStartDate());
		c.add(Calendar.DATE, sessionProduct.getDuration());
		return c.getTime();
	}

	private UserDetails getLoggedInUserDetails() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = userService.findUserDetailsByEmail(auth.getName());
		return userDetails;
	}
}
