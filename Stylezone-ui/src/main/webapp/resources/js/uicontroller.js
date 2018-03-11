function UIcontroller() {
}


//profile bar edit icon button click
UIcontroller.profileEditButtonClick = function() {
	$(".myprofile .readonly").each(function(i) {
		$(this).removeAttr("readonly");
	});

	$("#updateMyProfile").removeClass("hide");
}

//profile update update button click
UIcontroller.profileUpdateButtonClick = function() {
	var data = UIutiles.makeJsonObject(".myprofile");
	ServiceController.updateMyprofile(data);
}


//callback function for profile update
UIcontroller.profileUpdateCallBack=function(responseData)
{
	var response=responseData.data;
	var rootContainer=responseData.container;
	$(".myprofile .readonly").each(function(i) {
		$(this).attr("readonly",true);
	});
	$("#updateMyProfile").addClass("hide");
	$(".myprofile .message .text").text(responseData.message);
	$(".myprofile .message").show().delay(5000).fadeOut();
	if(response!=null){
		UIutiles.bindReponseToUi(response, "#header");
		UIutiles.bindReponseToUi(response, "." + rootContainer);
		$(".myprofile .message").removeClass("hide");
		$(".myprofile .message").removeClass("alert-danger");
		$(".myprofile .message").addClass("alert-success");
	}else
	{
		
		$(".myprofile .message").removeClass("hide");
		$(".myprofile .message").removeClass("alert-success");
		$(".myprofile .message").addClass("alert-danger");
		
	}
	
}


//add brand 
UIcontroller.addBrand=function()
{
	var data = UIutiles.makeJsonObject(".brandform");
	ServiceController.addBrand(data);
}


//add brandcallback
UIcontroller.addBrandCallBack=function(responseData)
{
	
	if(responseData.data!=null){
		UIutiles.bindReponseToUi(responseData.data, "." + responseData.container);
		$(".brandadd .message").removeClass("hide");
		$(".brandadd .message").removeClass("alert-danger");
		$(".brandadd .message").addClass("alert-success");
		
	}else
	{
		$(".brandadd .message").removeClass("hide");
		$(".brandadd .message").removeClass("alert-success");
		$(".brandadd .message").addClass("alert-danger");
		
	}
	$(".brandadd .message .text").text(response.message);
	$(".brandadd .message").show().delay(5000).fadeOut();
}



// load header details calling from footer loader
UIcontroller.updateUi = function(rootContainer) {
	if (rootContainer == "myprofile"){
		var requestObject={};
		requestObject.container=rootContainer;
		ServiceController.loadHeaderAndProfile(requestObject);
	}
}


//callback header
UIcontroller.callBackHeaderInfo = function(responseData) {
	UIutiles.bindReponseToUi(responseData.data, "#header");
	UIutiles.bindReponseToUi(responseData.data, "." + responseData.container);
}


