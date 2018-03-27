package com.project.stylezone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.stylezone.AppConstant;
import com.project.stylezone.models.OTP;
import com.project.stylezone.models.Users;
import com.project.stylezone.notification.EmailObject;
import com.project.stylezone.notification.EmailSenderObject;
import com.project.stylezone.notification.NotificationObjectFactory;
import com.project.stylezone.notification.NotificationType;
import com.project.stylezone.notification.NotificationTypeEnum;
import com.project.stylezone.notification.type.objects.AccountVerificationObject;
import com.project.stylezone.notification.type.objects.ForgotPasswordObject;
import com.project.stylezone.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/user/forgotPassword", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> sendOTP(@RequestBody OTP otp) {
		Users userDetails = userService.findUserByUserEmail(otp.getUser().getUserEmail());
				
		HttpHeaders responseHeaders = AppConstant.fetchHTTPHeaders();

		if (userDetails != null) {
			otp.setExpiryDate(AppConstant.getEpiryTime());
			otp.setUser(userDetails);
			OTP saveOTP = userService.saveOTP(otp);
			
			
			NotificationType notificationObject = NotificationObjectFactory
					.getNotificationObject(NotificationTypeEnum.FORGOTEPASSWORD);
			
			ForgotPasswordObject forgotPass = new ForgotPasswordObject();
			forgotPass.setMessageContent("OTP will be valid till 10 min : -");
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

		return AppConstant.convertToReponseEntity("data", responseHeaders, HttpStatus.OK);

	}

	
}
