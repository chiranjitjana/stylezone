package com.project.stylezone.notification;

public class EmailObject implements NotificationDataModel{
	private String receiver;
	private String subject;
	private String htmlEmailTemplate;
	
	private AccountVerificationObject accVerObj;

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public AccountVerificationObject getAccVerObj() {
		return accVerObj;
	}

	public void setAccVerObj(AccountVerificationObject accVerObj) {
		this.accVerObj = accVerObj;
	}

	public String getHtmlEmailTemplate() {
		return htmlEmailTemplate;
	}

	public void setHtmlEmailTemplate(String htmlEmailTemplate) {
		this.htmlEmailTemplate = htmlEmailTemplate;
	}

	
	
	
}
