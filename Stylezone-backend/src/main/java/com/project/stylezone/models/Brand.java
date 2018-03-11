package com.project.stylezone.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "brand")
public class Brand {

	@Id
	@Column(name = "b_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int brandId;

	@Column(name = "brand_name")
	private String brandName;

	/*@OneToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")*/
	@Column(name = "created_by")
	private int createdBy;

	@Column(name = "created_date")
	private String createdDate;

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
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

}
