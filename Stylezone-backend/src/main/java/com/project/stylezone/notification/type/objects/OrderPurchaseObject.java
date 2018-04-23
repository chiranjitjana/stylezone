package com.project.stylezone.notification.type.objects;

import com.project.stylezone.notification.NotificationDataModel;

public class OrderPurchaseObject implements NotificationDataModel{
	private String title;
	private String messageContent;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	
	
	
	
}
