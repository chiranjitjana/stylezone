package com.project.stylezone.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.project.stylezone.ProductDetailsMaker;

@Entity
@Table(name = "product_details_female_attributes")
public class ProductDetailFemaleAttr implements ProductDetailsMaker{

	@Id
	@Column(name = "attr_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int attrId;

	@OneToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinColumn(name = "p_details_id")
	private ProductDetails productDetails;

	@Column(name = "size")
	private String size;

	@Column(name = "bust")
	private String bust;

	@Column(name = "waist")
	private String waist;

	@Column(name = "hip")
	private String hip;

	@Column(name = "height")
	private String height;

	public int getAttrId() {
		return attrId;
	}

	public void setAttrId(int attrId) {
		this.attrId = attrId;
	}

	public ProductDetails getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(ProductDetails productDetails) {
		this.productDetails = productDetails;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getBust() {
		return bust;
	}

	public void setBust(String bust) {
		this.bust = bust;
	}

	public String getWaist() {
		return waist;
	}

	public void setWaist(String waist) {
		this.waist = waist;
	}

	public String getHip() {
		return hip;
	}

	public void setHip(String hip) {
		this.hip = hip;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

}
