function ServiceController() {

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
