package com.project.stylezone.notification.type;

import com.project.stylezone.notification.NotificationDataModel;
import com.project.stylezone.notification.NotificationType;
import com.project.stylezone.notification.type.objects.OrderPurchaseObject;

public class OrderPurchasedNotiType implements NotificationType {

	public String getNotificationContent(NotificationDataModel data) {
		// TODO Auto-generated method stub
		return null;
	}

	
	/*public String getNotificationContent(NotificationDataModel data) {
		OrderPurchaseOddbject model=(OrderPurchaseObject)data;
		
		String design = "<div style=\"border:1px solid #FFC300\">\r\n"
				+ "   <div style=\"background-color:#FFC300;color:#FFFFFF;height:70px;padding:10px;\">\r\n"
				+ "      <h3>StyleZone.com</h3>\r\n" + "      " + model.getTitle() + "\r\n"
				+ "   </div>\r\n" + "   <div style=\"height:80px;padding-left:10px;padding-right:10px;\">\r\n"
				+ "      <h5>" + localData.getMessageContent() + ":</h5>\r\n <h3>" + localData.getOTP()   + "</h3>   </div>\r\n" +
				
				"</div>";
		
		// TODO Auto-generated method stub
		return null;
	}*/

}
