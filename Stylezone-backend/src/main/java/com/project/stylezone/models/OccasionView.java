package com.project.stylezone.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="OccasionView")
public class OccasionView {

	@Id
	@Column(name = "oca_id")
	private int occasionId;

	@Column(name = "oca_name")
	private String occasionName;

	@Column(name = "user_name")
	private String createdBy;

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
