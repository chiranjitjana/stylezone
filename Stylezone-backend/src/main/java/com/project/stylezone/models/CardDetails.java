package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "card_details")
public class CardDetails {

	@Id
	@Column(name = "card_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cardId;
	
	
	@Column(name = "user_id")
	private int userId;
	
	
	@Column(name = "card_type")
	private String cardType;
	
	@Column(name = "name_on_card")
	private String nameOnCard;
	
	@Column(name = "card_number")
	private String cardNumber;
	
	
	@Column(name = "epiry_month")
	private int expiryMonth;
	
	
	@Column(name = "epiry_year")
	private int expiryYear;

	
	@Column(name = "cvv")
	private int cvv;

	public int getCardId() {
		return cardId;
	}


	public void setCardId(int cardId) {
		this.cardId = cardId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getNameOnCard() {
		return nameOnCard;
	}


	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}


	public String getCardNumber() {
		return cardNumber;
	}


	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}


	public int getExpiryMonth() {
		return expiryMonth;
	}


	public void setExpiryMonth(int expiryMonth) {
		this.expiryMonth = expiryMonth;
	}


	public int getExpiryYear() {
		return expiryYear;
	}


	public void setExpiryYear(int expiryYear) {
		this.expiryYear = expiryYear;
	}


	public int getCvv() {
		return cvv;
	}


	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
	
	
	
}
