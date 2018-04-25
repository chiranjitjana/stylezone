function ServiceController() {

}

/*Create user */
ServiceController.createUser=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.createUser;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.createUserCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}







/* load admin panel header */
ServiceController.loadHeaderAndProfile = function(parameter) {

	var object = {};
	object.url = adminPanelSideBarUrl.myprofile;
	object.methodtype = methodType.GET;
	object.data = null;
	object.container = parameter.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIcontroller.callBackHeaderInfo;
	object.callbackFuntionParameter = parameter;
	AjaxHandler.makeAjaxCall(object)
}

ServiceController.updateMyprofile = function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.saveAdmin;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.profileUpdateCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}

ServiceController.addBrand = function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.saveBrand;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.addBrandCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}

ServiceController.deleteBrand = function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.deleteBrand;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.deleteBrandCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}

ServiceController.addColor=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.saveColor;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.addColorCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.deleteColor=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.deleteColor;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.deleteColorCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.addOccasion=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.saveOccasion;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.addOcassionCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.deleteOccasion=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.deleteOccasion;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.deleteOccasionCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.addCat=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.saveCat;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.addCatCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.deleteCat=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.deleteCat;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.deleteCatCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.sendForgotPassOTP=function(requestObject) {
	var object = {};
	object.url = user.forgotPass;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIcontroller.sendForgotPassOTPCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}

ServiceController.verifyForgotPassOTP=function(requestObject) {
	var object = {};
	object.url = user.verifyOtpPass;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIcontroller.verifyForgotPassOTPCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.changePassword=function(requestObject) {
	var object = {};
	object.url = user.changePassword;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIcontroller.changePasswordCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}






/**********product8***************/
ServiceController.addProduct=function(requestObject) {
	var object = {};
	object.url = adminPanelButtonAction.saveProduct;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	/*object.contenttype = contenttype.application_json;*/
	object.callbackFunction = ProductController.addProductCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeMutipartAjaxCall(object);
}

ServiceController.fetchProduct=function(requestObject)
{
	var object = {};
	object.url = adminPanelButtonAction.fetchSingleProduct;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = ProductController.fetchSingleProductCallbackFunc;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.fetchProductAttr=function(requestObject)
{
	var object = {};
	object.url = adminPanelButtonAction.fetchProductAttr;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = ProductController.fetchProductAttrCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.deleteProduct=function(requestObject)
{
	var object = {};
	object.url = adminPanelButtonAction.deleteProduct;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = null;
	object.container = requestObject.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = ProductController.deleteProductCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


/************addToCart*********************/
ServiceController.addTocart=function(requestObject) {
	var object = {};
	object.url = website.addToCart;
	object.methodtype = methodType.POST;
	object.data =requestObject.data;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIWebsite.addToCartCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);
}



ServiceController.fetchcart=function(requestObject) {
	var object = {};
	object.url = website.fetchCart;
	object.methodtype = methodType.GET;
	object.data =null;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIWebsite.fetchCartCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);
}



ServiceController.RemoveFromCart=function(requestObject) {
	var object = {};
	object.url = website.removeFromCart;
	object.methodtype = methodType.POST;
	object.data =requestObject.data;
	object.container = requestObject.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIWebsite.RemoveFromCartCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);
}

/******************User address********************/
ServiceController.addAddress=function(requestObject) {
	var object = {};
	object.url = user.saveAddress;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIWebsite.addAddress;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);
}


ServiceController.deleteAddress=function(requestObject) {
	var object = {};
	object.url = user.deleteAddress;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIWebsite.deleteAddCallBack;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);
}


/*************load user address list*********************/

ServiceController.loadAddressList=function()
{
	var object = {};
	object.url = user.fectchAllAddress;
	object.methodtype = methodType.GET;
	object.data = null;
	object.datatype = datatype.json;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIWebsite.loadAddressListCallBak;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);

}

/****************update custom fitting appointment date****************/
ServiceController.updateCustomFitting=function(requestObject){
	var object = {};
	object.url = user.updateAppointmentDate;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIWebsite.UpdateCustomFittingAppntDateCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);
}

/*****************Pay Now******************************************/
ServiceController.makeCheckout=function(requestObject){
	var object = {};
	object.url = user.payNow;
	object.methodtype = methodType.POST;
	object.data = requestObject.data;
	object.datatype = datatype.json;
	object.container = requestObject.container;
	object.contenttype = contenttype.application_json;
	object.callbackFunction = UIWebsite.makeCheckoutCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);
	
}

/***********************admin fetch order details*********************/
ServiceController.fetchOrderDetails=function(requestObject)
{
	var object = {};
	object.url = requestObject.url;
	object.methodtype = methodType.GET;
	object.data = null;
	object.datatype = datatype.json;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIcontroller.fetchOrderDetailsCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);

}

/****************fetch tracker list *****************************/
ServiceController.trackerList=function(requestObject)
{
	var object = {};
	object.url = requestObject.url;
	object.methodtype = methodType.GET;
	object.data = null;
	object.datatype = datatype.json;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIcontroller.fetchTrackerListCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);

}
/******************save or update tracker***********************/
ServiceController.saveOrUpdateTracker=function(requestObject)
{
	var object = {};
	object.url = requestObject.url;
	object.methodtype = methodType.POST;
	object.data = null;
	object.datatype = datatype.json;
	object.container = null;
	object.contenttype = contenttype.url_encoding;
	object.callbackFunction = UIcontroller.saveOrUpdateOrderTrackerCallback;
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object);

}

