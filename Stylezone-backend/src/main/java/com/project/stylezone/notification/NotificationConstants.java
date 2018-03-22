package com.project.stylezone.notification;

public class NotificationConstants {

	
	
	
	public static  String getEmailTemplate(String title,String type,String message)
	{
		String design="<div style=\"border:1px solid #FFC300\">\r\n" + 
				"   <div style=\"background-color:#FFC300;color:#FFFFFF;height:70px;padding:10px;\">\r\n" + 
				"      <h3>StyleZone.com</h3>\r\n" + 
				"      "+title+"\r\n" + 
				"   </div>\r\n" + 
				"   <div style=\"height:80px;padding-left:10px;padding-right:10px;\">\r\n" + 
				"      <h5>"+message+":</h5>\r\n" + 
				"      <a href=\"http://www.google.com\">Google</a>\r\n" + 
				"   </div>\r\n" + 
				"</div>";
		
		return design;
	}
	
	

}
