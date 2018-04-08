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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + createdBy;
		result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
		result = prime * result + occasionId;
		result = prime * result + ((occasionName == null) ? 0 : occasionName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Occasion other = (Occasion) obj;
		if (createdBy != other.createdBy)
			return false;
		if (createdDate == null) {
			if (other.createdDate != null)
				return false;
		} else if (!createdDate.equals(other.createdDate))
			return false;
		if (occasionId != other.occasionId)
			return false;
		if (occasionName == null) {
			if (other.occasionName != null)
				return false;
		} else if (!occasionName.equals(other.occasionName))
			return false;
		return true;
	}
	
	
	
}
