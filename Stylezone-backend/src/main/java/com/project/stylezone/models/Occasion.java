package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="occasion")
public class Occasion {
	
	@Id
	@Column(name = "oca_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int occasionId;

	@Column(name = "oca_name")
	private String occasionName;

	@Column(name = "created_by")
	private int createdBy;

	@Column(name = "created_date")
	private String createdDate;

	public int getOccasionId() {
		return occasionId;
	}

	public void setOccasionId(int occasionId) {
		this.occasionId = occasionId;
	}

	public String getOccasionName() {
		return occasionName;
	}

	public void setOccasionName(String occasionName) {
		this.occasionName = occasionName;
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
