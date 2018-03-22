package com.project.stylezone.notification;

public class NotificationObjectFactory {

	public static NotificationType getNotificationObject(NotificationTypeEnum type)
	{
		NotificationType notiType=null;
		switch (type) {
		case VERIFYACCOUNT:
			notiType=new UserVerificationNotiType();
			break;

		}
		
		return notiType;
	}
	
}
