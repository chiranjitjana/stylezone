function AjaxHandler()
{

}

AjaxHandler.makeAjaxCall=function(requestObject)
{
	var request = $.ajax({
	  url: requestObject.url,
	  type: requestObject.methodtype,
	  data: requestObject.data,
	  dataType: requestObject.datatype,
	  contentType:requestObject.contenttype
	});

	request.done(function(msg) {
		requestObject.callbackFunction(msg);
	});

	request.fail(function(jqXHR, textStatus) {
	  alert( "Request failed: " + textStatus );
	});
	
}