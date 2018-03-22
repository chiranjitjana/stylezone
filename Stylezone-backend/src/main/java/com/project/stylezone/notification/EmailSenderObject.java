package com.project.stylezone.notification;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.project.stylezone.AppConstant;

public class EmailSenderObject {

	private static Properties getProperties()
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
		return props;
	}
	
	private static Session getSession()
	{
		Session session = Session.getDefaultInstance(getProperties(),
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(AppConstant.accountEmail,AppConstant.accountPassword);
					}
				});
		
		return session;
	}
	
	
	public static boolean sendEmail(EmailObject object)
	{
		Message message = new MimeMessage(getSession());
		try {
			message.setFrom(new InternetAddress(AppConstant.accountEmail));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(object.getReceiver()));
			message.setSubject(object.getSubject());
			message.setContent(object.getHtmlEmailTemplate(),"text/html" );  
			Transport.send(message);
			return true;
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
}
