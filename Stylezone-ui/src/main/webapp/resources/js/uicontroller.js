function UIcontroller() {
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

	if (responseData.data != null) {
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
	UIutiles.bindReponseToUi(responseData.data, "#header");
	UIutiles.bindReponseToUi(responseData.data, "." + responseData.container);
}

// fetchBrandList
UIcontroller.fetchAllBrands = function() {
	var requestObject = {};
	requestObject.container = "brandList";
	ServiceController.loadBrandsList(requestObject);

}

//
UIcontroller.fetchBrandListCallback = function(responseData) {
	var data = responseData.data;
	var container = "." + responseData.container;
	

	
	
	for (var i = 0; i < data.length; i++) {
		var tr = $("<tr></tr>");

		var response = data[i];
		for ( var key in response) {
			var td = $("<td></td>");

			if (response.hasOwnProperty(key)) {
				var span = $("<span></span>");
				span.addClass(key)
				span.text(response[key]);
				td.append(span);
			}
			tr.append(td);
		}
		$(container).append(tr);
	}
	
	

}
