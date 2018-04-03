package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product_details_table")
public class ProductDetails {

	@Id
	@Column(name = "p_details_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productDetailsId;

	
	@Column(name = "title")
	private String productTitle;
	
	
	@Column(name = "description")
	private String productDescription;
	
	
	@Column(name = "custom_fiting_available")
	private Integer customFitting;
	
	@Column(name = "pr_img1")
	private String avt1;
	
	
	@Column(name = "pr_img2")
	private String avt2;
	
	@Column(name = "pr_img3")
	private String avt3;
	
	
	@Column(name = "gender_type")
	private char gender;
	
	
	@Column(name="rent_price")
	private Integer rentPrice;
	
	@Column(name="deposite_per")
	private Integer depositePercentage;
	
	
	@Column(name="duration4")
	private char duration4;
	
	@Column(name="duration6")
	private char duration6;
	
	@Column(name="duration8")
	private char duration8;

	public int getProductDetailsId() {
		return productDetailsId;
	}

	public void setProductDetailsId(int productDetailsId) {
		this.productDetailsId = productDetailsId;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Integer getCustomFitting() {
		return customFitting;
	}

	public void setCustomFitting(Integer customFitting) {
		this.customFitting = customFitting;
	}

	public String getAvt1() {
		return avt1;
	}

	public void setAvt1(String avt1) {
		this.avt1 = avt1;
	}

	public String getAvt2() {
		return avt2;
	}

	public void setAvt2(String avt2) {
		this.avt2 = avt2;
	}

	public String getAvt3() {
		return avt3;
	}

	public void setAvt3(String avt3) {
		this.avt3 = avt3;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Integer getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(Integer rentPrice) {
		this.rentPrice = rentPrice;
	}

	public Integer getDepositePercentage() {
		return depositePercentage;
	}

	public void setDepositePercentage(Integer depositePercentage) {
		this.depositePercentage = depositePercentage;
	}

	public char getDuration4() {
		return duration4;
	}

	public void setDuration4(char duration4) {
		this.duration4 = duration4;
	}

	public char getDuration6() {
		return duration6;
	}

	public void setDuration6(char duration6) {
		this.duration6 = duration6;
	}

	public char getDuration8() {
		return duration8;
	}

	public void setDuration8(char duration8) {
		this.duration8 = duration8;
	}
	
	
	
}
