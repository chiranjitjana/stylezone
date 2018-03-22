package com.project.stylezone.notification;


public class UserVerificationNotiType implements NotificationType {

	public String getNotificationContent(NotificationDataModel data) {
		// TODO Auto-generated method stub
		AccountVerificationObject localData = (AccountVerificationObject) data;
		String design = "<div style=\"border:1px solid #FFC300\">\r\n"
				+ "   <div style=\"background-color:#FFC300;color:#FFFFFF;height:70px;padding:10px;\">\r\n"
				+ "      <h3>StyleZone.com</h3>\r\n" + "      " + localData.getTitle() + "\r\n"
				+ "   </div>\r\n" + "   <div style=\"height:80px;padding-left:10px;padding-right:10px;\">\r\n"
				+ "      <h5>" + localData.getMessageContent() + ":</h5>\r\n" + "      <a href=\"" + localData.getHref()
				+ "\">Verify My Account</a>\r\n" + "   </div>\r\n" + "</div>";

		return design;

	}

}
