package com.project.stylezone.notification;

import com.project.stylezone.notification.type.*;

public class NotificationObjectFactory {

	public static NotificationType getNotificationObject(NotificationTypeEnum type)
	{
		NotificationType notiType=null;
		switch (type) {
		case VERIFYACCOUNT:
			notiType=new UserVerificationNotiType();
			break;
		case FORGOTEPASSWORD:
			notiType=new UserForgotPassNotiType();
		case ORDERPURCHASED:
			notiType=new OrderPurchasedNotiType();

		}
		
		return notiType;
	}
	
}
