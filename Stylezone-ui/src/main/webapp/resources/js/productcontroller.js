function ProductController() {

}

/** ******** CATEGORY ********** */
ProductController.fetchCategory = function() {
	var fetchAllcategory = adminPanelButtonAction.fecthAllCat;
	var object = {};
	object.url = fetchAllcategory;
	object.methodtype = methodType.GET;
	object.data = null;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = ProductController.listCategory;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)

}

ProductController.listCategory = function(responseData) {
	var options = "<option value='-1'>Select</option>";
	for (var i = 0; i < responseData.data.length; i++) {
		var catName = responseData.data[i].catName;
		var catId = responseData.data[i].catId;
		options += "<option value=" + catId + ">" + catName + "</option>";
	}
	$(".productform #catId").empty();
	$(".productform #catId").append(options);
}

/** ******** Brand ********** */

ProductController.fetchBrand = function() {
	var fetchAllBrand = adminPanelButtonAction.fecthAllBrands;
	var object = {};
	object.url = fetchAllBrand;
	object.methodtype = methodType.GET;
	object.data = null;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = ProductController.listBrand;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)

}

ProductController.listBrand = function(responseData) {
	var options = "<option value='-1'>Select</option>";
	for (var i = 0; i < responseData.data.length; i++) {
		var brandName = responseData.data[i].brandName;
		var brandId = responseData.data[i].brandId;
		options += "<option value=" + brandId + ">" + brandName + "</option>";
	}
	$(".productform #brandId").empty();
	$(".productform #brandId").append(options);
}

/** ******** Color ********** */

ProductController.fetchColor = function() {
	var fetchAllColor = adminPanelButtonAction.fecthAllColors;
	var object = {};
	object.url = fetchAllColor;
	object.methodtype = methodType.GET;
	object.data = null;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = ProductController.listColor;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)

}

ProductController.listColor = function(responseData) {
	var options = "<option value='-1'>Select</option>";
	for (var i = 0; i < responseData.data.length; i++) {
		var colorName = responseData.data[i].colorName;
		var colorId = responseData.data[i].colorId;
		var colorCode = responseData.data[i].colorCode;
		options += "<option value=" + colorId + " style='background-color:#"
				+ colorCode + "' >" + colorName + "</option>";
	}
	$(".productform #colorId").empty();
	$(".productform #colorId").append(options);
}

/** ******** Occasion ********** */

ProductController.fetchOccasion = function() {
	var fetchAllOccasion = adminPanelButtonAction.fecthAllOccasion;
	var object = {};
	object.url = fetchAllOccasion;
	object.methodtype = methodType.GET;
	object.data = null;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = ProductController.listOccasion;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)

}

ProductController.listOccasion = function(responseData) {
	var options = "<option value='-1'>Select</option>";
	for (var i = 0; i < responseData.data.length; i++) {
		var occasionName = responseData.data[i].occasionName;
		var occasionId = responseData.data[i].occasionId;
		options += "<option value=" + occasionId + ">" + occasionName
				+ "</option>";
	}
	$(".productform #occasionId").empty();
	$(".productform #occasionId").append(options);
}

ProductController.refresh = function() {
	ProductController.fetchCategory();
	ProductController.fetchBrand();
	ProductController.fetchColor();
	ProductController.fetchOccasion();
}

/** *************** CREATE PRODUCT************** */
ProductController.create = function() {

	if (ProductController.Validate()) {
		$(".productform .message").attr("style",true);
		$(".productform .message").addClass("hide");
		$(".productform .message").removeClass("alert-danger");
		var data=ProductController.createData();
		var requestObject = {};
		requestObject.container = "productform";
		requestObject.data = data;
		ServiceController.addProduct(requestObject);
	} else {
		$(".productform .message").attr("style",false);
		$(".productform .message").removeClass("hide");
		$(".productform .message").addClass("alert-danger");
		$(".productform .message .text").text("Provide all the fields details");
		$('#productCreate').animate({
			scrollTop : 0
		}, 'slow');
	}
}



ProductController.addProductCallBack=function(responseData) {
	ProductController.loadProductList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	$('#productCreate').animate({
		scrollTop : 0
	}, 'slow');
}





ProductController.createData=function()
{
	var data={};
	data.product=ProductController.fetchProduct();
	
	if($(".productform #male").is(":checked"))
	data.productDetailsMale=ProductController.fetchMaleAttr();
	else
	data.productDetailFemaleAttr=ProductController.fetchFeMaleAttr();
	var ret=JSON.stringify(data);
	return ret;
	
}

ProductController.fetchMaleAttr=function()
{
	var male={};
	male.topSize=$(".productform .topSize").val();
	male.bottomSize=$(".productform .bottomSize").val();
	return male;
}

ProductController.fetchFeMaleAttr=function()
{
	var female={};
	female.size=$(".productform .size").val();
	female.bust=$(".productform .bust").val();
	female.waist=$(".productform .waist").val();
	female.hip=$(".productform .hip").val();
	female.height=$(".productform .height").val();

	return female;
}

ProductController.fetchProduct=function()
{
	var product={};
	var brand={};
	brand.brandId=$(".productform .brandId").val();
	
	var category={};
	category.catId=$(".productform .catId").val();
		
	var occasion={};
	occasion.occasionId=$(".productform .occasionId").val();
	
	var color={};
	color.colorId=$(".productform .colorId").val();
	
		
	product.brand=brand;
	product.category=category;
	product.color=color;
	product.occasion=occasion;
	product.availableInstock=1;
	product.productDetails=ProductController.fetchProductDtls();
	
	return product;
}

ProductController.fetchProductDtls=function()
{
	var productDetails={};
	productDetails.productTitle=$(".productform .productTitle").val();
	productDetails.productDescription=$(".productform .productDescription").val();
	productDetails.customFitting=$(".productform .customFitting").val();
	if($(".productform #female").is(":checked"))
	productDetails.gender="F";
	if($(".productform #male").is(":checked"))
	productDetails.gender="M";
	productDetails.rentPrice=$(".productform .rentPrice").val();
	productDetails.depositePercentage=$(".productform .depositePercentage").val();
	
	if($(".productform #duration4").is(":checked"))
		productDetails.duration4="Y";
	else
		productDetails.duration4="N";
		
	if($(".productform #duration6").is(":checked"))
		productDetails.duration6="Y";
	else
		productDetails.duration6="N";
		
	if($(".productform #duration8").is(":checked"))
		productDetails.duration8="Y";
	else
		productDetails.duration8="N";
		
	return productDetails;
}

/*** Dirty validation done****/


ProductController.Validate = function() {
	var rturn = true;

	rturn = ProductController.CustomValidatorLogic($("#productform"));

	// female attribute
	if ($("#female").is(":checked")) {


		if (new RegExp(UIutiles.getRegex("emptystring")).test($(
				".productform  .size").val())) {
			$(".productform .size").addClass("error");
			rturn = false;
		} else {
			$(".productform  .size").removeClass("error");
			
		}
		if (new RegExp(UIutiles.getRegex("emptystring")).test($(
				".productform .bust").val())) {
			$(".productform .bust").addClass("error");
			rturn = false;
		} else {
			$(".productform  .bust").removeClass("error");
		}
		if (new RegExp(UIutiles.getRegex("emptystring")).test($(
				".productform  .waist").val())) {
			$(".productform .waist").addClass("error");
			rturn = false;
		} else {
			$(".productform  .waist").removeClass("error");
		}

		if (new RegExp(UIutiles.getRegex("emptystring")).test($(
				".productform .hip").val())) {
			$(".productform .hip").addClass("error");
			rturn = false;
		} else {
			$(".productform  .hip").removeClass("error");
		}
		if (new RegExp(UIutiles.getRegex("emptystring")).test($(
				".productform  .height").val())) {
			$(".productform .height").addClass("error");
			rturn = false;
		} else {
			$(".productform  .height").removeClass("error");
		}

	}

	if ($("#male").is(":checked")) {


		if (new RegExp(UIutiles.getRegex("emptystring")).test($(
				".productform .topSize").val())) {
			$(".productform .topSize").addClass("error");
			rturn = false;
		} else {
			$(".productform  .topSize").removeClass("error");
		}

		if (new RegExp(UIutiles.getRegex("emptystring")).test($(
				".productform .bottomSize").val())) {
			$(".productform .bottomSize").addClass("error");
			rturn = false;
		} else {
			$(".productform  .bottomSize").removeClass("error");
		}
	}

	return rturn;
}

ProductController.CustomValidatorLogic = function(object) {
	var clz = object.attr("id");
	console.log(clz);
	var ret = true;
	$("#" + clz).children("div").each(
			function() {
				$(this).find("input").each(
						function() {

							if (($(this).attr("hidden_id")) != undefined)
								console.log("hidden_id "
										+ $(this).attr("hidden_id"));

							var id = $(this).attr("id");
							var value = $("#" + clz + " #" + id).val();

							if (new RegExp(UIutiles.getRegex("emptystring"))
									.test(value)
									&& !$("#" + clz + " #" + id).hasClass(
											"hide") && $(this).attr("type")!="radio" && $(this).attr("type")!="checkbox") {
								$("#" + clz + " #" + id).addClass("error");
								$("#" + clz + " #" + id).attr("placeholder",
										"Please provide " + id);
								ret = false;
							} else {
								$("#" + clz + " #" + id).removeClass("error");
							}
						});

				$(this).find("select").each(
						function() {

							var id = $(this).attr("id");
							var value = $("#" + clz + " #" + id).val();
							console.log("selected value :" + value);
							if (value === "-1"
									&& !$("#" + clz + " #" + id).hasClass(
											"hide")) {
								$("#" + clz + " #" + id).addClass("error");
								$("#" + clz + " #" + id).attr("placeholder",
										"Please provide " + id);
								ret = false;
							} else {
								$("#" + clz + " #" + id).removeClass("error");
							}
						});

				$(this).find("textarea").each(
						function() {
							var id = $(this).attr("id");
							var value = $("#" + clz + " #" + id).val();
							if (new RegExp(UIutiles.getRegex("emptystring"))
									.test(value)
									&& !$("#" + clz + " #" + id).hasClass(
											"hide")) {
								$("#" + clz + " #" + id).addClass("error");
								$("#" + clz + " #" + id).attr("placeholder",
										"Please provide " + id);
								ret = false;
							} else {
								$("#" + clz + " #" + id).removeClass("error");
							}
						});

				
		
				/*
				 * var isChecked = false;
				 * $(this).find("input").each(function() {

					if ($(this).attr("type") === "checkbox") {

						if ($(this).is(":checked")) {
							isChecked = true;
							$(".duration").removeClass("error");
						} else {
							if (isChecked == false) {
								$(".duration").addClass("error");
								ret = false;
							}
						}
					}

				});*/
				
				if($("#" + clz).find("input:checkbox[name=duration]:checked").length==0){
					$(".duration").addClass("error");
					ret = false;
				}else
				{
					$(".duration").removeClass("error");
				}
				
		
				if($("#" + clz).find("input:radio[name=gender]:checked").length==0){
					$(".gendertype").addClass("error");
					ret = false;
				}else
				{
					$(".gendertype").removeClass("error");
				}
					
				

			});
	return ret;

}


/**load product list**/
ProductController.loadProductList = (function() {
	var instance;
	function createInstance() {
		var object = $('.products  #productsTable')
				.DataTable(
						{
							"ajax" : {
								"url" : adminPanelButtonAction.fecthAllProduct,
								"dataSrc" : ""
							},
							"columns" : [
									{
										"data" : "pId"
									},
									{
										"data" : "title"
									},
									{
										"data" : "gender"
									},
									{
										"data" : "inStock"
									},
									{
										"data" : "createDateFormated"
									},
									{
										"data" : "createBy"
									},

									{
										"targets" : -1,
										"data" : null,
										"defaultContent" : "<button class='btn btn-info update-btn'>Update </button>"
									},
									{
										"targets" : -1,
										"data" : null,
										"defaultContent" : "<button class='btn btn-danger delete-btn' >Delete </button>"
									} ],
							"columnDefs" : [ {
								"targets" : [ 0 ],
								"visible" : false
							} ],
							'info' : true,
							"fnDrawCallback" : function() {
								
								ProductController.refresh();
								$(".products .proListCount")
										.text(
												"("
														+ this
																.fnSettings()
																.fnRecordsTotal()
														+ ")");
							}

						});
		return object;
	}

	return {
		getInstance : function() {
			if (!instance) {
				instance = createInstance();
			}
			return instance;
		}
	};
})();