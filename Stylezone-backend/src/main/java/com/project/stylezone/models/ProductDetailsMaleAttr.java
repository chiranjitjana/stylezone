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
@Table(name = "product_details_male_attributes")
public class ProductDetailsMaleAttr implements ProductDetailsMaker{

	@Id
	@Column(name = "attr_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int attrId;

	@OneToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinColumn(name = "p_details_id")
	private ProductDetails productDetails;
	
	@Column(name = "top_size")
	private String topSize;
	
	@Column(name = "bottom_size")
	private String bottomSize;

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

	public String getTopSize() {
		return topSize;
	}

	public void setTopSize(String topSize) {
		this.topSize = topSize;
	}

	public String getBottomSize() {
		return bottomSize;
	}

	public void setBottomSize(String bottomSize) {
		this.bottomSize = bottomSize;
	}
	
	
	
	
}
