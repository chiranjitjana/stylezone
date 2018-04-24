function UIcontroller() {
}

//create user

UIcontroller.createUser = function() {
	var data = UIutiles.makeJsonObject(".signupfrmcontainer");
	var requestObject = {};
	requestObject.container = "signupfrmcontainer";
	requestObject.data = data;
	ServiceController.createUser(requestObject);

}

UIcontroller.createUserCallback = function(responseData) {

	console.log(responseData)

	UIutiles.handleReponse(responseData);

}

// profile bar edit icon button click
UIcontroller.profileEditButtonClick = function() {
	$(".myprofile .readonly").each(function(i) {
		$(this).removeAttr("readonly");
	});

	$("#updateMyProfile").removeClass("hide");
}

// profile update update button click
UIcontroller.profileUpdateButtonClick = function() {
	var data = UIutiles.makeJsonObject(".myprofile");
	var requestObject = {};
	requestObject.container = "myprofile";
	requestObject.data = data;
	ServiceController.updateMyprofile(requestObject);
}

// callback function for profile update
UIcontroller.profileUpdateCallBack = function(responseData) {
	var response = responseData.data;
	var rootContainer = responseData.container;
	$(".myprofile .readonly").each(function(i) {
		$(this).attr("readonly", true);
	});
	$("#updateMyProfile").addClass("hide");
	$(".myprofile .message .text").text(responseData.message);
	$(".myprofile .message").show().delay(5000).fadeOut();
	if (response != null) {
		UIutiles.bindReponseToUi(response, "#header");
		UIutiles.bindReponseToUi(response, "." + rootContainer);
		$(".myprofile .message").removeClass("hide");
		$(".myprofile .message").removeClass("alert-danger");
		$(".myprofile .message").addClass("alert-success");
	} else {

		$(".myprofile .message").removeClass("hide");
		$(".myprofile .message").removeClass("alert-success");
		$(".myprofile .message").addClass("alert-danger");

	}

}

// add brand
UIcontroller.addBrand = function() {
	var data = UIutiles.makeJsonObject(".brandform");
	var requestObject = {};
	requestObject.container = "brandform";
	requestObject.data = data;
	ServiceController.addBrand(requestObject);
}

// add brandcallback
UIcontroller.addBrandCallBack = function(responseData) {

	UIutiles.handleReponse(responseData);
	UIcontroller.loadBrandList.getInstance().ajax.reload();

}

UIcontroller.deleteBrand = function() {
	var data = UIutiles.makeJsonObject("#deleteBrand");
	var requestObject = {};
	requestObject.container = "deleteBrand";
	requestObject.data = data;
	ServiceController.deleteBrand(requestObject);
}

UIcontroller.deleteBrandCallBack = function(responseData) {
	UIcontroller.loadBrandList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	$('#deleteBrand').modal('hide');
}

UIcontroller.addColor = function() {
	var data = UIutiles.makeJsonObject(".colorform");
	var requestObject = {};
	requestObject.container = "colorform";
	requestObject.data = data;
	ServiceController.addColor(requestObject);
}

UIcontroller.addColorCallback = function(responseData) {
	UIutiles.handleReponse(responseData);
	UIcontroller.loadColorList.getInstance().ajax.reload();
}

UIcontroller.deleteColor = function() {
	var data = UIutiles.makeJsonObject("#deleteColor");
	var requestObject = {};
	requestObject.container = "deleteColor";
	requestObject.data = data;
	ServiceController.deleteColor(requestObject);
}

UIcontroller.deleteColorCallBack = function(responseData) {
	UIcontroller.loadColorList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	$('#deleteColor').modal('hide');
}

UIcontroller.addOcasions = function() {
	var data = UIutiles.makeJsonObject(".occasionform");
	var requestObject = {};
	requestObject.container = "occasionform";
	requestObject.data = data;
	ServiceController.addOccasion(requestObject);
}

UIcontroller.addOcassionCallBack = function(responseData) {
	UIcontroller.loadOccasionList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
}

UIcontroller.deleteOccasion = function() {
	var data = UIutiles.makeJsonObject("#deleteOccasion");
	var requestObject = {};
	requestObject.container = "deleteOccasion";
	requestObject.data = data;
	ServiceController.deleteOccasion(requestObject);
}

UIcontroller.deleteOccasionCallBack = function(responseData) {
	UIcontroller.loadOccasionList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	$('#deleteOccasion').modal('hide');
}

UIcontroller.addCat = function() {
	var data = UIutiles.makeJsonObject(".catform");
	var requestObject = {};
	requestObject.container = "catform";
	requestObject.data = data;
	ServiceController.addCat(requestObject);
}

UIcontroller.addCatCallBack = function(responseData) {
	UIcontroller.loadCatList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
}

UIcontroller.deleteCat = function() {
	var data = UIutiles.makeJsonObject("#deleteCat");
	var requestObject = {};
	requestObject.container = "deleteCat";
	requestObject.data = data;
	ServiceController.deleteCat(requestObject);
}

UIcontroller.deleteCatCallBack = function(responseData) {
	UIcontroller.loadCatList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	$('#deleteCat').modal('hide');
}

// load header details calling from footer loader
UIcontroller.updateUi = function(rootContainer) {
	if (rootContainer == "myprofile") {
		var requestObject = {};
		requestObject.container = rootContainer;
		ServiceController.loadHeaderAndProfile(requestObject);
	}
}

// callback header
UIcontroller.callBackHeaderInfo = function(responseData) {
	if(responseData.data.roleName=="Superadmin"){
		$(".sidebarcontainer").find(".approveStaff").removeClass("hide");
	}
	
	UIutiles.bindReponseToUi(responseData.data, "#header");
	UIutiles.bindReponseToUi(responseData.data, "." + responseData.container);
}

//loadDataTableUsing ajax call

UIcontroller.loadBrandList = (function() {
	var instance;
	function createInstance() {
		var object = $('.brands #brands')
				.DataTable(
						{
							"ajax" : {
								"url" : adminPanelButtonAction.fecthAllBrands,
								"dataSrc" : ""
							},
							"columns" : [
									{
										"data" : "brandId"
									},
									{
										"data" : "brandName"
									},
									{
										"data" : "createdBy"
									},
									{
										"data" : "createdDate"
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
								$(".brands .brandlistcount")
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

UIcontroller.loadColorList = (function() {
	var instance;
	function createInstance() {
		var object = $('.colors  #colors')
				.DataTable(
						{
							"ajax" : {
								"url" : adminPanelButtonAction.fecthAllColors,
								"dataSrc" : ""
							},
							"columns" : [
									{
										"data" : "colorId"
									},
									{
										"data" : "colorCode"
									},
									{
										"className" : 'details-control',
										"orderable" : false,
										"data" : null,
										"render" : function(data, type, row,
												meta) {
											return "<div style='height:30px;width:30px;background-color:#"
													+ row.colorCode
													+ "'></div>"
										}
									},
									{
										"data" : "colorName"
									},
									{
										"data" : "createdDate"
									},
									{
										"data" : "createdBy"
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
								$(".colors .colorlistcount")
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

UIcontroller.loadOccasionList = (function() {
	var instance;
	function createInstance() {
		var object = $('.occasions  #occasions')
				.DataTable(
						{
							"ajax" : {
								"url" : adminPanelButtonAction.fecthAllOccasion,
								"dataSrc" : ""
							},
							"columns" : [
									{
										"data" : "occasionId"
									},
									{
										"data" : "occasionName"
									},
									{
										"data" : "createdDate"
									},
									{
										"data" : "createdBy"
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
								$(".occasions .occasionlistcount")
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

UIcontroller.loadCatList = (function() {
	var instance;
	function createInstance() {
		var object = $('.category  #category')
				.DataTable(
						{
							"ajax" : {
								"url" : adminPanelButtonAction.fecthAllCat,
								"dataSrc" : ""
							},
							"columns" : [
									{
										"data" : "catId"
									},
									{
										"data" : "catName"
									},
									{
										"data" : "createdDate"
									},
									{
										"data" : "createdBy"
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
								$(".category .catlistcount")
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

/*user section*/

UIcontroller.sendForgotPassOTP = function() {
	$("#forgotpass #userEmail").prop("readonly", true);
	$("#forgotpass .otpsending").removeClass("hide");
	var email = $("#forgotpass #userEmail").val();
	var data = {
		"user" : {
			"userEmail" : email
		}
	};
	var requestObject = {};
	requestObject.container = "forgotpass";
	requestObject.data = JSON.stringify(data);
	ServiceController.sendForgotPassOTP(requestObject);
}

UIcontroller.sendForgotPassOTPCallback = function(responseData) {
	$("#forgotpass .otpsending").addClass("hide");
	$("#forgotpass #otptxtvalue").removeClass("hide");
	if (responseData.message === "OTP sent to your Email ID") {
		$("#forgotpass .sendOTP").addClass("hide");

		$("#forgotpass .checkOTP").removeClass("hide");

		$(".otptxtbox").removeClass("hide");
		$("#forgotpass .checkOTP").prop("disabled", false);

		UIutiles.bindReponseToUi(responseData.data, "."
				+ responseData.container);
		$("." + responseData.container + " .message").removeClass("hide");
		$("." + responseData.container + " .message").removeClass(
				"alert-danger");
		$("." + responseData.container + "  .message")
				.addClass("alert-success");

	} else {

		$("." + responseData.container + "  .message").removeClass("hide");
		$("." + responseData.container + "  .message").removeClass(
				"alert-success");
		$("." + responseData.container + "  .message").addClass("alert-danger");
	}
	$("." + responseData.container + "  .message .text").text(
			responseData.message);
	$("." + responseData.container + "  .message").show().delay(5000).fadeOut();

}

UIcontroller.verifyForgotPassOTP = function() {
	
	var email = $("#forgotpass #userEmail").val();
	var otp = $("#forgotpass #otptxtvalue").val();

	var data = {}
	data.email = email;
	data.otp = otp;

	var requestObject = {};
	requestObject.container = "forgotpass";
	requestObject.data = data;
	ServiceController.verifyForgotPassOTP(requestObject);
}

UIcontroller.verifyForgotPassOTPCallBack = function(responseData) {

	$("#forgotpass #otptxtvalue").removeClass("error");
	if (responseData.message === "OTP matched") {

		UIutiles.bindReponseToUi(responseData.data, "."
				+ responseData.container);
		$("." + responseData.container + " .message").removeClass("hide");
		$("." + responseData.container + " .message").removeClass(
				"alert-danger");
		$("." + responseData.container + "  .message")
				.addClass("alert-success");

		$("." + responseData.container + "  .message .text").text(
				responseData.message);
		$("." + responseData.container + "  .message").show().delay(5000)
				.fadeOut();

		$("#forgotpass #otptxtvalue").addClass("hide");
		$("#forgotpass .checkOTP").addClass("hide");
		$("#forgotpass .changePassword").removeClass("hide");

		$("#forgotpass .password1").removeClass("hide");
		$("#forgotpass .password2").removeClass("hide");

	} else {

		$("." + responseData.container + "  .message").removeClass("hide");
		$("." + responseData.container + "  .message").removeClass(
				"alert-success");
		$("." + responseData.container + "  .message").addClass("alert-danger");

		$("." + responseData.container + "  .message .text").text(
				responseData.message);
		$("." + responseData.container + "  .message").show().delay(5000)
				.fadeOut();

	}

	UIcontroller.changePassword = function() {
		var email = $("#forgotpass #userEmail").val();
		var pass1 = $("#forgotpass .password1").val();
		var pass2 = $("#forgotpass .password2").val();

		var noError=true;
		if(new RegExp(UIutiles.getRegex("emptystring")).test(pass1))
		{
			$("#forgotpass .password1").addClass("error");
			
			if(noError==true)
			noError=false;
		}
		
		if(new RegExp(UIutiles.getRegex("emptystring")).test(pass2))
		{
			$("#forgotpass .password2").addClass("error");
			if(noError==true)
				noError=false;
		}
		
		
		if(!new RegExp(UIutiles.getRegex("emptystring")).test(pass2) && !new RegExp(UIutiles.getRegex("emptystring")).test(pass1))
		{
			
			if(pass2!=pass1)
			{
				noError=false;
				$(".forgotpass  .message").addClass("alert-danger");
				$(".forgotpass  .message").removeClass("hide");
				
				$(".forgotpass  .message .text").text(
						"Password Not Matched");
				$(".forgotpass .message").show().delay(5000)
						.fadeOut();
			}
		}
			
		
		
		
		if(noError!=false)
		{
			
			var data = {}
			data.email = email;
			data.password = pass1;
			var requestObject = {};
			requestObject.container = "forgotpass";
			requestObject.data = data;
			ServiceController.changePassword(requestObject);
			
		}
		
		
	
	}

	UIcontroller.changePasswordCallBack = function(responseData) {

		$("#forgotpass #otptxtvalue").removeClass("error");
		if (responseData.message === "Password Changed .Login with new password") {

			UIutiles.bindReponseToUi(responseData.data, "."
					+ responseData.container);
			$("." + responseData.container + " .message").removeClass("hide");
			$("." + responseData.container + " .message").removeClass(
					"alert-danger");
			$("." + responseData.container + "  .message").addClass(
					"alert-success");

			$("." + responseData.container + "  .message .text").text(
					responseData.message);
			$("." + responseData.container + "  .message").show().delay(5000)
					.fadeOut();

			$("#forgotpass #otptxtvalue").addClass("hide");
			$("#forgotpass .checkOTP").addClass("hide");
			$("#forgotpass .changePassword").removeClass("hide");

			$("#forgotpass .password1").removeClass("hide");
			$("#forgotpass .password2").removeClass("hide");
			
			setTimeout(function() { $('#pwdModal').modal('hide'); }, 3000);

		} else {

			$("." + responseData.container + "  .message").removeClass("hide");
			$("." + responseData.container + "  .message").removeClass(
					"alert-success");
			$("." + responseData.container + "  .message").addClass(
					"alert-danger");

			$("." + responseData.container + "  .message .text").text(
					responseData.message);
			$("." + responseData.container + "  .message").show().delay(5000)
					.fadeOut();

		}
	}
}


UIcontroller.reInitForgotPassword=function()
{
	$("#forgotpass #userEmail").prop("readonly", false);
	$("#forgotpass #userEmail").val("");
	$("#forgotpass #otptxtvalue").val("");
	$("#forgotpass #password1").val("");
	$("#forgotpass #password2").val("");
	
	$("#forgotpass #otptxtvalue").addClass("hide");
	$("#forgotpass .checkOTP").addClass("hide");
	$("#forgotpass .changePassword").addClass("hide");

	$("#forgotpass .password1").addClass("hide");
	$("#forgotpass .password2").addClass("hide");
	$("#forgotpass .sendOTP").removeClass("hide");
	
}

/*********************************fetch all order list for  admin panel********************/
UIcontroller.loadAllOrdersList = (function() {
	var instance;
	function createInstance() {
		var object = $('.adminorders  #ordersTableAdmin')
				.DataTable(
						{
							"ajax" : {
								"url" : adminPanelButtonAction.orderAdminList,
								"dataSrc" : ""
							},
							"columns" : [
									{
										"data" : "orderId"
									},
									{
										"data" : "createdDate"
									},
									{
										"data" : "rentTotal",
										 render : function(data, type, row) {
								              return '<span>&#8377;'+data+'</span>'
								          }   
									},
									{
										"data" : "depositeTotal",
											 render : function(data, type, row) {
									              return '<span>&#8377;'+data+'</span>'
									          }   
									},
									{
										"data" : "total",
											 render : function(data, type, row) {
									              return '<span>&#8377;'+data+'</span>'
									          }   
									},
									{
										"targets" : -1,
										"data" : null,
										"defaultContent" : "<button class='btn btn-info update-status' >Update Status</button>"
										
										
									},
									{
										"targets" : -2,
										"data" : null,
										"defaultContent" : "<button class='btn btn-info view-details' >View Details </button>"
										
										
									}
									],
							'info' : true,
							"fnDrawCallback" : function() {

								$(".adminorders .orderListcount")
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

/*******************************order details in admin panel**********************/
UIcontroller.fetchOrderDetails=function(orderId){
	var requestObject = {};
	requestObject.container = null;
	requestObject.data = null;
	requestObject.url=adminPanelButtonAction.orderDetails+"/"+orderId;
	ServiceController.fetchOrderDetails(requestObject);
	
}

UIcontroller.fetchOrderDetailsCallback=function(responseData){
	
	console.log(responseData);
	UIcontroller.bindDataToModal("#viewOrderDetails",responseData.data);
	
	
	
	$('#viewOrderDetails').modal('show');
}

UIcontroller.bindDataToModal=function(root,data){
	var root=$(root);
	
	root.find(".orderId").text(data.orderId);
	root.find(".productCount").text(data.productCount);
	root.find(".totalRent").text(data.rentTotal);
	root.find(".totalDeposit").text(data.depositeTotal);
	root.find(".totalOrderCost").text(data.total);
	root.find(".deliveryAddress").val(data.address);
	root.find(".userName").text(data.username);
	root.find(".userEmail").text(data.useremail);
	root.find(".userMobile").text(data.userphone);
	root.find(".userMobile").text(data.userphone);
	root.find(".orderDate").text(data.createdDate);
	
	
	var productList=data.tempOrderProductList;
	var tbody=root.find(".order_productList");
	
	var trs=[];
	tbody.find("tr").not(":first").remove();
	for(var x=0;x<productList.length;x++){
		var localTR=root.find(".tr_order_info_template").clone();
		localTR.removeClass("hide");
		localTR.find(".productAvt").attr("src","FileServlet?path="+productList[x].productAvt);
		localTR.find(".productTitle").text(productList[x].productTitle);
		localTR.find(".productDuration").text(productList[x].duration);
		localTR.find(".startDate").text(productList[x].startDate);
		localTR.find(".endDate").text(productList[x].endDate);
		localTR.find(".customFittingAppointmentDate").text(productList[x].customFittingAppointmentDate);
		localTR.find(".rentCost").text(productList[x].rentPrice);
		localTR.find(".depositCost").text(productList[x].deposite);
		localTR.find(".totalCost").text(productList[x].totalPrice);
		trs.push(localTR);
	}
	tbody.append(trs);
	
}

UIcontroller.fetchOrderTrackerList=function(){
	var data=[];
	data.push({"orderStatus":-1,"title":"Select"})
	data.push({"orderStatus":1,"title":"Order Request Accepted"})
	data.push({"orderStatus":2,"title":"Order Packing in Progress"})
	data.push({"orderStatus":3,"title":"Order Out for Delivery"})
	data.push({"orderStatus":4,"title":"Order Delivered"})
	data.push({"orderStatus":5,"title":"Order Return Back"})
	data.push({"orderStatus":6,"title":"Order Deposit Amount Return"})
	
	return data;
}

/**************************fetch tracker list form db admin panel*********/
UIcontroller.fetchAllTrackerListFromDBforOrder=function(orderID){
	var requestObject = {};
	requestObject.container = null;
	requestObject.data = null;
	requestObject.url=adminPanelButtonAction.orderTrackerFetch+orderID;
	ServiceController.trackerList(requestObject);
}

UIcontroller.fetchTrackerListCallback=function(responseData){
	console.log(responseData);
	var selecttag=$("#updateStatus").find("#trackerstatus");
	selecttag.empty();
	var data=responseData.data;
	
	
	var localArr=UIcontroller.fetchOrderTrackerList();

	for(var x=0;x<localArr.length;x++){
		for(var y=0;y<data.length;y++){
			if(localArr[x].orderStatus==data[y].orderStatus){
				localArr.splice(x,1);
			}
		}
	}
	var options=[];
	for(var x=0;x<localArr.length;x++){
		var option=$("<option></option>").text(localArr[x].title);
		option.attr("value",localArr[x].orderStatus);
		options.push(option);
	}
	selecttag.append(options);
	
	
	$("#updateStatus").modal("show");
}


/************************update tracker for ***************************/
