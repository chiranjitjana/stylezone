package com.project.stylezone.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "product_list")
public class ProductListView {

	@Id
	@Column(name = "product_id")
	private int pId;

	@Column(name = "title")
	private String title;

	@Column(name = "gender")
	private String gender;

	@Column(name = "brand")
	private int brand;

	@Column(name = "category")
	private int category;

	@Column(name = "color")
	private int color;

	@Column(name = "occasion")
	private int occasion;

	@Column(name = "availability")
	private int availability;

	@Column(name = "create_by")
	private String createBy;

	@Column(name = "create_date")
	private Date createDate;

	
	@Transient
	private String inStock;
	
	
	
	public String getInStock() {
		return inStock;
	}

	public void setInStock(String inStock) {
		this.inStock = inStock;
	}

	@Transient
	private String createDateFormated;

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getBrand() {
		return brand;
	}

	public void setBrand(int brand) {
		this.brand = brand;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getColor() {
		return color;
	}

	public void setColor(int color) {
		this.color = color;
	}

	public int getOccasion() {
		return occasion;
	}

	public void setOccasion(int occasion) {
		this.occasion = occasion;
	}

	public int getAvailability() {
		return availability;
	}

	public void setAvailability(int availability) {
		this.availability = availability;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateDateFormated() {
		return createDateFormated;
	}

	public void setCreateDateFormated(String createDateFormated) {
		this.createDateFormated = createDateFormated;
	}

	
	
}
