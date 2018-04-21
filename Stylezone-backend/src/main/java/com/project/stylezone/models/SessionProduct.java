package com.project.stylezone.models;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SessionProduct {

	private Integer productId;
	
	private String productTitle;
	
	
	private String avt;
	
	private String customFitting;
	
	private String customFittingAppointmentDate;
	
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	private Date startDate;
	
	private Integer duration;
	
	private Integer rentPrice;
	
	private Integer deposite;
	
	private Integer totalPrice;

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Integer getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(Integer rentPrice) {
		this.rentPrice = rentPrice;
	}

	public Integer getDeposite() {
		return deposite;
	}

	public void setDeposite(Integer deposite) {
		this.deposite = deposite;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	
	
	
	
	
	public String getAvt() {
		return avt;
	}

	public void setAvt(String avt) {
		this.avt = avt;
	}

	public String getCustomFitting() {
		return customFitting;
	}

	public void setCustomFitting(String customFitting) {
		this.customFitting = customFitting;
	}

	
	
	
	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	
	
	
	public String getCustomFittingAppointmentDate() {
		return customFittingAppointmentDate;
	}

	public void setCustomFittingAppointmentDate(String customFittingAppointmentDate) {
		this.customFittingAppointmentDate = customFittingAppointmentDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((deposite == null) ? 0 : deposite.hashCode());
		result = prime * result + ((duration == null) ? 0 : duration.hashCode());
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		result = prime * result + ((rentPrice == null) ? 0 : rentPrice.hashCode());
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + ((totalPrice == null) ? 0 : totalPrice.hashCode());
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
		SessionProduct other = (SessionProduct) obj;
		if (deposite == null) {
			if (other.deposite != null)
				return false;
		} else if (!deposite.equals(other.deposite))
			return false;
		if (duration == null) {
			if (other.duration != null)
				return false;
		} else if (!duration.equals(other.duration))
			return false;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		if (rentPrice == null) {
			if (other.rentPrice != null)
				return false;
		} else if (!rentPrice.equals(other.rentPrice))
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		if (totalPrice == null) {
			if (other.totalPrice != null)
				return false;
		} else if (!totalPrice.equals(other.totalPrice))
			return false;
		return true;
	}
	
	
	
}
