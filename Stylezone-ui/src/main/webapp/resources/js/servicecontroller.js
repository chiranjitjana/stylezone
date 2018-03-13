function ServiceController() {
	
}

/* load admin panel header*/
ServiceController.loadHeaderAndProfile=function(parameter)
{
	
	var object={};
	object.url=adminPanelSideBarUrl.myprofile;
	object.methodtype=methodType.GET;
	object.data=null;
	object.container=parameter.container;
	object.contenttype=contenttype.url_encoding;
	object.callbackFunction=UIcontroller.callBackHeaderInfo;
	object.callbackFuntionParameter=parameter;
	AjaxHandler.makeAjaxCall(object)
}

ServiceController.updateMyprofile=function(requestObject)
{
	var object={};
	object.url=adminPanelButtonAction.saveAdmin;
	object.methodtype=methodType.POST;
	object.data=requestObject.data;
	object.datatype=datatype.json;
	object.container=requestObject.container;
	object.contenttype=contenttype.application_json;
	object.callbackFunction=UIcontroller.profileUpdateCallBack;
	object.callbackFuntionParameter=null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.addBrand=function(requestObject)
{
	var object={};
	object.url=adminPanelButtonAction.saveBrand;
	object.methodtype=methodType.POST;
	object.data=requestObject.data;
	object.datatype=datatype.json;
	object.container=requestObject.container;
	object.contenttype=contenttype.application_json;
	object.callbackFunction=UIcontroller.addBrandCallBack;
	object.callbackFuntionParameter=null;
	AjaxHandler.makeAjaxCall(object)
}


ServiceController.loadBrandsList=function(requestObject)
{
	var object={};
	object.url=adminPanelButtonAction.fecthAllBrands;
	object.methodtype=methodType.GET;
	object.data=null;
	object.datatype=datatype.json;
	object.container=requestObject.container;
	object.contenttype=contenttype.url_encoding;
	object.callbackFunction=UIcontroller.fetchBrandListCallback;
	object.callbackFuntionParameter=null;
	AjaxHandler.makeAjaxCall(object)
}