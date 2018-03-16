package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ColorView")
public class ColorView {
	@Id
	@Column(name = "color_id")
	private int colorId;

	@Column(name = "color_code")
	private String colorCode;

	@Column(name = "color_name")
	private String colorName;

	@Column(name = "user_name")
	private String createdBy;
	
	
	@Column(name = "created_date")
	private String createdDate;


	public int getColorId() {
		return colorId;
	}


	public void setColorId(int colorId) {
		this.colorId = colorId;
	}


	public String getColorCode() {
		return colorCode;
	}


	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}


	public String getColorName() {
		return colorName;
	}


	public void setColorName(String colorName) {
		this.colorName = colorName;
	}


	public String getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}


	public String getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	
	
	
	
}
