function UIWebsite() {
}

// calling ajax for all menu
UIWebsite.loadMenMenu = function(type, container) {
	var fetchAllMenu = website.fetchMenu;
	var data = {
		"gender" : type
	};

	var object = {};
	object.url = fetchAllMenu;
	object.methodtype = methodType.POST;
	object.data = data;
	object.container = container;
	object.contenttype = contenttype.url_encoding;

	if (type === "M") {
		object.callbackFunction = UIWebsite.loadMenuMenCallBack;
	} else {
		object.callbackFunction = UIWebsite.loadMenuWomenCallBack;
	}
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}

// if calling type is men then this callback function is called
UIWebsite.loadMenuMenCallBack = function(responseData) {
	var data = responseData.data;

	var categoryDiv = $(".menlist .category_list");
	var catList = data.categoryList;
	UIWebsite.loadCat(categoryDiv, catList);

	var brandDiv = $(".menlist .brand_list");
	var brandList = data.brandList;
	UIWebsite.loadBrand(brandDiv, brandList);

	var occasionDiv = $(".menlist .occasion_list");
	var occasionList = data.occasionList;
	UIWebsite.loadOcassion(occasionDiv, occasionList);

	var categorySideBarDiv = $(".mens_sidebar .categories");
	UIWebsite.loadCatSideBar(categorySideBarDiv, catList);
}

// if calling type is women then this callback function is called
UIWebsite.loadMenuWomenCallBack = function(responseData) {
	var data = responseData.data;

	var categoryDiv = $(".womenlist .category_list");
	var catList = data.categoryList;
	UIWebsite.loadCat(categoryDiv, catList)

	var brandDiv = $(".womenlist .brand_list");
	var brandList = data.brandList;
	UIWebsite.loadBrand(brandDiv, brandList);

	var occasionDiv = $(".womenlist .occasion_list");
	var occasionList = data.occasionList;
	UIWebsite.loadOcassion(occasionDiv, occasionList);

	var colorDiv = $(".womenlist .color_list");
	var colorList = data.colorList;
	UIWebsite.loadColor(colorDiv, colorList);

	var categorySideBarDiv = $(".womens_sidebar .categories");
	UIWebsite.loadCatSideBar(categorySideBarDiv, catList);
}

// load category
UIWebsite.loadCat = function(categoryDiv, cat) {
	for (var x = 0; x < cat.length; x++) {
		var localAnchor = $("<a></a>");
		localAnchor.text(cat[x].catName);
		localAnchor.attr("href", adminPanel.root + "/getProducts/Category/"
				+ cat[x].catId);
		categoryDiv.append(localAnchor);
	}
}

// load brand
UIWebsite.loadBrand = function(brandDiv, brand) {
	for (var x = 0; x < brand.length; x++) {
		var localAnchor = $("<a></a>");
		localAnchor.text(brand[x].brandName);
		localAnchor.attr("href", adminPanel.root + "/getProducts/Brand/"
				+ brand[x].brandId);
		brandDiv.append(localAnchor);
	}
}

// load occasion
UIWebsite.loadOcassion = function(occasionDiv, occasion) {
	for (var x = 0; x < occasion.length; x++) {
		var localAnchor = $("<a></a>");
		localAnchor.text(occasion[x].occasionName);
		localAnchor.attr("href", adminPanel.root + "/getProducts/Occasion/"
				+ occasion[x].occasionId);
		occasionDiv.append(localAnchor);
	}
}

// load color
UIWebsite.loadColor = function(colorDiv, color) {
	for (var x = 0; x < color.length; x++) {
		var localAnchor = $("<a></a>");
		localAnchor.text(color[x].colorName);
		localAnchor.attr("href", adminPanel.root + "/getProducts/Color/"
				+ color[x].colorId);
		colorDiv.append(localAnchor);
	}
}

// category side bar
UIWebsite.loadCatSideBar = function(categoryDiv, cat) {
	for (var x = 0; x < cat.length; x++) {
		var li = $("<li></li>");
		var localAnchor = $("<a></a>");
		localAnchor.text(cat[x].catName);
		localAnchor.attr("href", adminPanel.root + "/getProducts/Category/"
				+ cat[x].catId);
		li.append(localAnchor);
		categoryDiv.append(li);
	}
}

/** *************home latest product********** */
UIWebsite.loadProductListLatestHome = function() {
	var fetchLatestProducts = website.fetchHomePageLatest;
	var object = {};
	object.url = fetchLatestProducts;
	object.methodtype = methodType.POST;
	object.data = null;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIWebsite.callbackLatestProductHome;

	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}

UIWebsite.callbackLatestProductHome = function(responseData) {
	var data = responseData.data;
	var path = "FileServlet?path=";
	var container = $(".homepage .product_list");

	var dataList = [];
	for (var x = 0; x < data.length; x++) {
		var product = $(".homepage .product-template").clone();
		product.attr("productId", data[x].product.productId);
		product.attr('onclick', 'UIWebsite.handleProductClick('
				+ data[x].product.productId + ')');
		product.removeClass("hide");
		product.find(".product_avt").attr("src",
				path + data[x].product.productDetails.avt1);
		product.find(".product_price").text(
				data[x].product.productDetails.rentPrice);
		product.find(".product_name").text(
				data[x].product.productDetails.productTitle);

		var duration;
		if (data[x].product.productDetails.duration4 === "Y") {
			duration = " 4 Days";
		} else if (data[x].product.productDetails.duration6 === "Y") {
			duration = " 6 Days";
		} else {
			duration = " 8 Days";
		}

		product.find(".product_price_duration").text(
				data[x].product.productDetails.rentPrice + " for " + duration);

		product.find(".product_description").text(
				data[x].product.productDetails.productDescription);

		dataList.push(product);

	}

	var arrays = [], size = 3;

	while (dataList.length > 0) {
		arrays.push(dataList.splice(0, size));
	}

	for (var i = 0; i < arrays.length; i++) {

		var wrapper = $("<div></div>").append(arrays[i]);
		wrapper.addClass("row");
		arrays[i] = wrapper;
	}

	container.append(arrays);

}

UIWebsite.handleProductClick = function(productId) {
	window.location = website.fetchProducts + productId;

}

UIWebsite.AddtoCart = function() {

	if (new RegExp(UIutiles.getRegex("emptystring")).test($(".deliveryDP")
			.val())) {

		$(".deliveryDP").addClass("error");
	} else {

		$(".deliveryDP").removeClass("error");
		var duration;

		if ($("#duration4").find("input[type='radio']").prop("checked") == true) {
			duration = 4;

		} else if ($("#duration6").find("input[type='radio']").prop("checked")) {
			duration = 6;

		} else if ($("#duration8").find("input[type='radio']").prop("checked") == true) {
			duration = 8;
		}

		var customFitting = "N";
		if ($('div.customFittingAvailable').length > 0) {
			customFitting = "Y";

		}

		var avt = $(".avt1").attr("src").split("../../");

		var data = {};
		data.customFitting = customFitting;
		data.avt = avt[1];
		data.productTitle = $(".productTitle").text();
		data.productId = $(".product-detail").find(".productId").val();
		data.startDate = $(".deliveryDP").val();
		data.duration = duration;
		data.rentPrice = parseInt($(".price-info-txt").text());
		data.deposite = parseInt($(".refundable_amt").text());
		data.totalPrice = parseInt(data.rentPrice) + parseInt(data.deposite);

		var requestObject = {};
		requestObject.container = null;
		requestObject.data = JSON.stringify(data);

		ServiceController.addTocart(requestObject);
	}

}

UIWebsite.addToCartCallback = function(responseData) {

	alert(responseData.message);
	UIWebsite.fetchCart();
}

UIWebsite.fetchCart = function() {
	var data = {};
	var requestObject = {};
	requestObject.container = "cartcontainer";
	requestObject.data = null
	ServiceController.fetchcart(requestObject);
}

UIWebsite.fetchCartCallback = function(responseData) {

	// console.log(responseData);
	var data = responseData.data;
	$(".cartcount").text(data.length);

	for (var x = 0; x < data.length; x++) {
		if ($(".product-detail").find(".productId").val() == data[x].productId) {
			$(".addpro" + data[x].productId).addClass("disable");
		} else {

			$(".addpro" + data[x].productId).removeClass("disable");
		}

	}

	// logic for showing products in cart page

	if (data.length > 0) {
		$(".cart_wrapper").removeClass("hide");
		$(".emptycart").addClass("hide");
		var tbody = $(".cart_table_body");
		tbody.find("tr").not(":first").remove();
		var dataToPush = [];
		var rental = 0;
		var deposite = 0;
		for (var x = 0; x < data.length; x++) {
			var tr = tbody.find(".tr").clone();
			tr.removeClass("hide");
			tr.attr("productId", data[x].productId);
			tr.find(".avt").attr("src", data[x].avt);
			tr.find(".productTiltle").text(data[x].productTitle);
			tr.find(".startDate").text(data[x].startDate);
			tr.find(".duration").text(data[x].duration + " Days");
			tr.find(".rental_price").text(data[x].rentPrice);
			tr.find(".refundable_price").text(data[x].deposite);
			tr.find(".product_total_price").text(data[x].totalPrice);
			tr.find(".cart_quantity_delete").attr("productId",
					data[x].productId);

			if (data[x].customFitting == "Y") {
				var calendar = $('<input/>');
				calendar.attr("id", "appointDate" + data[x].productId)

				calendar.attr("onClick", "UIWebsite.ShowDatePicker("
						+ data[x].productId + ",'" + data[x].startDate + "',"
						+ data[x].duration + ")");
				calendar.attr("type", "text");
				calendar.attr("placeholder", "Fitting Appointment");

				tr.find(".customFittingCalendar").append(calendar);

			}

			tr.find(".cart_quantity_delete").attr("onClick",
					"UIWebsite.RemoveFromCart(" + data[x].productId + ")");

			rental = rental + data[x].rentPrice;
			deposite = deposite + data[x].deposite;
			dataToPush.push(tr);
		}
		tbody.append(dataToPush);

		$(".total_rental_cost").text(rental);
		$(".total_refunable_cost").text(deposite);
		$(".total_rental_refundable").text(rental + deposite);
	} else {
		$(".cart_wrapper").addClass("hide");
		$(".emptycart").removeClass("hide");

	}
	
	
	if($(".checkoutpage").length){
		UIWebsite.HandleCheckOutPage(data);
	}

}

UIWebsite.RemoveFromCart = function(productId) {

	// alert(productId);
	var data = {
		"productID" : parseInt(productId)
	};
	var requestObject = {};
	requestObject.container = null;
	requestObject.data = data;
	ServiceController.RemoveFromCart(requestObject);
}

UIWebsite.RemoveFromCartCallBack = function(responseData) {
	console.log(responseData);
	alert(responseData.message);
	UIWebsite.fetchCart();
}

/** *****************Create Address********************** */
UIWebsite.createAddress = function() {

	var data = UIutiles.makeJsonObject(".addressfrom");
	var requestObject = {};
	requestObject.container = "addressfrom";
	requestObject.data = data;
	ServiceController.addAddress(requestObject);
}

UIWebsite.addAddress = function(responseData) {
	UIutiles.handleReponse(responseData);

	if (responseData.message == "Address Created") {
		setTimeout(function() {
			$('#addressModal').modal('hide');
		}, 3000);
		UIutiles.resetForm("#addressModal");
		UIWebsite.loadMyAddressList.getInstance().ajax.reload();
	}

}

/** *******Delete Address*********************************** */
UIWebsite.deleteAddress = function() {
	var dataVAL = $("#deleteAddress .addId").val();

	var data = {
		"addId" : parseInt(dataVAL)
	};

	var postData = {};
	postData.addId = data;

	var requestObject = {};
	requestObject.container = "addressfrom";
	requestObject.data = data;
	ServiceController.deleteAddress(requestObject);
}

UIWebsite.deleteAddCallBack = function(responseData) {
	UIWebsite.loadMyAddressList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	setTimeout(function() {
		$('#deleteAddress').modal('hide');
	}, 3000);

}

/** ********************fetching address list***************** */
UIWebsite.loadMyAddressList = (function() {
	var instance;
	function createInstance() {
		var object = $('.delivery_address  #adressTable')
				.DataTable(
						{
							"ajax" : {
								"url" : user.fectchAllAddress,
								"dataSrc" : ""
							},
							"columns" : [
									{
										"data" : "addId"
									},
									{
										"data" : "line1"
									},
									{
										"data" : "line2"
									},
									{
										"data" : "city"
									},
									{
										"data" : "state"
									},
									{
										"data" : "postcode"
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

								$(".delivery_address .addlistcount")
										.text(
												"("
														+ this
																.fnSettings()
																.fnRecordsTotal()
														+ ")");

								$(".delivery_add_count").text(
										this.fnSettings().fnRecordsTotal());
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

/** ********************appoinment date calendar***************** */
UIWebsite.ShowDatePicker = function(id, startdt, duration) {
	// console.log("startdate "+startdt);

	alert("Please Select Appointment Date");

	$("#appointDate" + id).datepicker({
		dateFormat : "dd-mm-yy",
		minDate : 0,
		maxDate : startdt
	});

}

/** ***********************load address list to ********************** */

UIWebsite.loadAddressList = function() {
	ServiceController.loadAddressList();
}

UIWebsite.loadAddressListCallBak = function(responseData) {
	console.log(responseData)
	var data = responseData.data;

	var list = [];

	if (data.length > 0) {
		$(".rq_address").addClass("hide");
		$(".delivery_address").addClass("show");
		for (var x = 0; x < data.length; x++) {
			var addressdiv = $(".delivery_address").find(".address_template")
					.clone();
			addressdiv.find(".addressradiobtn").attr("id","add"+data[x].addId);
			addressdiv.find(".addressradiobtn").attr("addressId",data[x].addId);
			if(x==0){
				addressdiv.find(".addressradiobtn").prop("checked",true);
			}
			
			addressdiv.removeClass("hide");
			addressdiv.find(".address").attr("id","addspan"+data[x].addId);
			addressdiv.find(".address").html(
					data[x].line1 + ", " + data[x].line2 + "<br/>"
							+ data[x].city + "," + data[x].state + " ,"
							+ data[x].postcode);

			list.push(addressdiv)
		}

		$(".delivery_address").append(list);
	} else {
		$(".rq_address").addClass("show");
		$(".delivery_address").addClass("hide");
	}
}

/** *******************CustomFitting Appointment Update**************** */
UIWebsite.UpdateCustomFittingAppntDate = function() {
	var tbody = $(".cart_wrapper").find(".cart_table_body");
	var dateList = [];

	tbody.find("tr").each(
			function() {

				if ($(this).attr("productid") != undefined) {

					var fittingDate = $(this).find(
							"#appointDate" + $(this).attr("productid")).val();
					if (fittingDate != undefined
							&& !(new RegExp(UIutiles.getRegex("emptystring"))
									.test(fittingDate))) {
						var date = {};
						date.productId = parseInt($(this).attr("productid"));
						date.appointMentDate = fittingDate;
						dateList.push(date);

					}

				}
			});

	var tempList={"appointmentList":dateList};
	
	var requestObject ={}
	requestObject.container = null;
	requestObject.data = JSON.stringify(tempList);
	ServiceController.updateCustomFitting(requestObject);

}

UIWebsite.UpdateCustomFittingAppntDateCallback = function(responseData) {

	var flag=0;
	var message = $(".cart_wrapper").find(".message");
	message.addClass("hide");
	if(responseData.message="Product Appointment Dates are not available"){
		var data=responseData.data;
		
		var tbody = $(".cart_wrapper").find(".cart_table_body");
		tbody.find("tr").each(function(){
		
				$(this).removeClass("appointmentDateNotValid");
			
		});
		
		
		
		for(var x=0;x<data.length;x++){
			flag=0;
			
			tbody.find("tr").each(function(){
				if($(this).attr("productid")==data[x]){
					if(flag==0)
					flag=1;
					$(this).addClass("appointmentDateNotValid");
				}
			});
		}
		
	}
	
	
	if(flag==0){
		window.location.href = "/Stylezone-ui/myaccount/show/checkout";
	}
	else
	{

		message.addClass("alert alert-danger");
		message.removeClass("hide");
		message.text("Appointment Date for Custom Fitting not Available");
	}
	
}


/***************************Handle Checkout page**********************/
UIWebsite.HandleCheckOutPage=function(data){
	if (data.length > 0) {
		$(".checkoutpage .cart_wrapper").removeClass("hide");
		$("checkoutpage .emptycart").addClass("hide");
		var tbody = $(".checkoutpage .product_detaills");
		var tr_costinfo=$(".cost_info").clone();
		
		
		tbody.find("tr").not(":first").remove();
		var dataToPush = [];
		var rental = 0;
		var deposite = 0;
		for (var x = 0; x < data.length; x++) {
			var tr = tbody.find(".tr").clone();
			tr.removeClass("hide");
			tr.attr("productId", data[x].productId);
			tr.find(".avt").attr("src", "../../"+data[x].avt);
			tr.find(".productTiltle").text(data[x].productTitle);
			tr.find(".startDate").text(data[x].startDate);
			tr.find(".duration").text(data[x].duration + " Days");
			tr.find(".rental_price").text(data[x].rentPrice);
			tr.find(".refundable_price").text(data[x].deposite);
			tr.find(".product_total_price").text(data[x].totalPrice);
			tr.find(".cart_quantity_delete").attr("productId",
					data[x].productId);

			if (data[x].customFitting == "Y") {
				var calendar = $('<input/>');
				calendar.attr("id", "appointDate" + data[x].productId)
				calendar.attr("type", "text");
				calendar.val(data[x].customFittingAppointmentDate);
				calendar.prop("disabled",true);
				calendar.attr("placeholder", "Fitting Appointment");

				tr.find(".customFittingCalendar").append(calendar);

			}

			tr.find(".cart_quantity_delete").attr("onClick",
					"UIWebsite.RemoveFromCart(" + data[x].productId + ")");

			rental = rental + data[x].rentPrice;
			deposite = deposite + data[x].deposite;
			dataToPush.push(tr);
		}
		
		dataToPush.push(tr_costinfo);
	
		
		tbody.append(dataToPush);

		$(".checkoutpage .total_rental_cost").text(rental);
		$(".checkoutpage .total_refunable_cost").text(deposite);
		$(".checkoutpage .total_rental_refundable").text(rental + deposite);
	}
}

/************************Validate Card Info*****************************/
UIWebsite.ValidateCard=function()
{
	var flag=false;
	var name=$("#cc-name");
	var card_number=$("#cc-number");
	var expireMonth=$(".monthExp");
	var expireYear=$(".yearExp");
	var cvv=$("#cc-cvv");
	
	flag= UIWebsite.requiredCheckValidator(name,flag);
	flag=UIWebsite.requiredCheckValidator(card_number,flag);
	flag=UIWebsite.requiredCheckValidator(cvv,flag);
	flag=UIWebsite.requiredCheckValidator(expireMonth,flag);
	flag=UIWebsite.requiredCheckValidator(expireYear,flag);
	
	
	
	if(flag==false){
		if(!UIWebsite.validateCardNumber(card_number.val(),flag)){
			card_number.addClass("error");
			card_number.attr("title","Card number is not valid");
			card_number.tooltip();
			if(flag==false)
			flag=true;
		}else
		{
			card_number.removeClass("error");
		}
	}
	
	
	
	return !flag;
}



UIWebsite.validateCardNumber=function(number,flag) {
    return luhnCheck(number);
}

function luhnCheck(val) {
    var sum = 0;
    for (var i = 0; i < val.length; i++) {
        var intVal = parseInt(val.substr(i, 1));
        if (i % 2 == 0) {
            intVal *= 2;
            if (intVal > 9) {
                intVal = 1 + (intVal % 10);
            }
        }
        sum += intVal;
    }
    return (sum % 10) == 0;
}



UIWebsite.requiredCheckValidator=function(data,flag){
	
	if(data.attr("type")=="text" || data.attr("type")=="number"){
	if(new RegExp(UIutiles.getRegex("emptystring")).test(data.val())){
			data.addClass("error");
			data.tooltip();
			if(flag==false){
				flag=true;
			}
		}else
		{
			data.removeClass("error");
			
		}
	}
	else
	{
		if(data.val()==="-1"){
			data.addClass("error");
			data.tooltip();
			if(flag==false){
				flag=true;
			}
		}
		else
		{
			data.removeClass("error");
			
		}
	}
	
	return flag;
}

/***************************make checkout*****************/
UIWebsite.makeCheckout=function()
{
	var tempAdd=$(".delivery_address").find("input[name='deliveryAddoption']:checked");
	
	var address={};
	address.address=$(".delivery_address").find("#addspan"+tempAdd.attr("addressId")).text();
	
	
	var tempCardContainer=$("#payNOw");
	var cardDetails={};
	cardDetails.cardType=tempCardContainer.find("input[name='paymentMethod']:checked").val();
	cardDetails.nameOnCard=tempCardContainer.find("#cc-name").val();
	cardDetails.cardNumber=tempCardContainer.find("#cc-number").val();
	cardDetails.expiryMonth=tempCardContainer.find("#exMonth").val();
	cardDetails.expiryYear=tempCardContainer.find("#exYear").val();
	cardDetails.cvv=tempCardContainer.find("#cc-cvv").val();
	
	
	
	var tempData={};
	tempData.address=address;
	tempData.cardDetails=cardDetails;
	
	var requestObject = {};
	requestObject.container = "paynowcontainer";
	requestObject.data = JSON.stringify(tempData);
	
	console.log(requestObject);
	
	ServiceController.makeCheckout(requestObject)
}

UIWebsite.makeCheckoutCallback=function(responseData){
	console.log(responseData);
	alert("Order Placed");
}
