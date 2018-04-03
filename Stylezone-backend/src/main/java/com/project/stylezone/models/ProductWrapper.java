package com.project.stylezone.models;



public class ProductWrapper {

	private Product product;
	private ProductDetailsMaleAttr productDetailsMale;
	private ProductDetailFemaleAttr productDetailFemaleAttr;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductDetailsMaleAttr getProductDetailsMale() {
		return productDetailsMale;
	}

	public void setProductDetailsMale(ProductDetailsMaleAttr productDetailsMale) {
		this.productDetailsMale = productDetailsMale;
	}

	public ProductDetailFemaleAttr getProductDetailFemaleAttr() {
		return productDetailFemaleAttr;
	}

	public void setProductDetailFemaleAttr(ProductDetailFemaleAttr productDetailFemaleAttr) {
		this.productDetailFemaleAttr = productDetailFemaleAttr;
	}

	

}
