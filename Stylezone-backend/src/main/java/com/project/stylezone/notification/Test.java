package com.project.stylezone.notification;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import com.project.stylezone.AppConstant;


public class Test {

	//https://myaccount.google.com/lesssecureapps?pli=1
	//turn on
	
	public static void main(String...arrgs)
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(AppConstant.accountEmail,AppConstant.accountPassword);
				}
			});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(AppConstant.accountEmail));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("chiranjit.jana19@gmail.com"));
			message.setSubject("Account Verification");
	/*		message.setText("Please click on below link to activate your account " +
					"www.google.com");*/
			message.setContent(NotificationConstants.getEmailTemplate("Verify Account", "register", "Please click on bellow link to verify your account"),"text/html" );  
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
