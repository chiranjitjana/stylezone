package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "colors")
public class Color {

	
	@Id
	@Column(name = "color_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int colorId;

	@Column(name = "color_name")
	private String colorName;

	@Column(name = "color_code")
	private String colorCode;
	

	@Column(name = "created_by")
	private int createdBy;

	@Column(name = "created_date")
	private String createdDate;

	public int getColorId() {
		return colorId;
	}

	public void setColorId(int colorId) {
		this.colorId = colorId;
	}

	public String getColorName() {
		return colorName;
	}

	public void setColorName(String colorName) {
		this.colorName = colorName;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getColorCode() {
		return colorCode;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	
	
	
}
