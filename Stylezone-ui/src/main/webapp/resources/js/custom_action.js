function UIcontroller() {
	
}

UIcontroller.getRegex=function(type){
			switch(type) {
		    case "emptystring":
		        return  /^\s*$/ ;
		        break;
		 
		}
	
}


UIcontroller.profileEditButtonClick = function() {
	$(".readonly").each(function(i) {
		$(this).removeAttr("readonly");
	});
	
	$("#updateMyProfile").removeClass("hide");
}


UIcontroller.profileUpdateButtonClick=function()
{
	
}

UIcontroller.profileUpdateButtonClickValidator=function(object)
{
	var clz=object.attr("id");
	console.log(clz);
	
	$("#"+clz).children("div").each(function () {		
		$(this).children("input").each(function(){
			
			if(($(this).attr("hidden_id"))!=undefined)
			console.log("hidden_id "+$(this).attr("hidden_id"));
		
			var id=$(this).attr("id");
			var value=$("#"+id).val();
			
			
			if(new RegExp(UIcontroller.getRegex("emptystring")).test(value))
			{
				$("#"+id).addClass("error");
				$("#"+id).attr("placeholder","Please provide name"+id);
			}
			else
			{
				$("#"+id).removeClass("error");
			}
			/*
			 * console.log("id "+$(this).attr("id")); console.log("value "+);
			 */
		});
	});
	
	
	return false;
}



// load header details

UIcontroller.loadHeader=function(email)
{
	console.log(email);
	var object={};
	var email={email};
	object.url=adminPanel.root+adminPanel.adminpanel+adminPanel.fetchAdminDetails;
	object.methodtype=methodType.POST;
	object.data=email;
	object.datatype=datatype.json;
	object.contenttype=contenttype.url_encoding;
	object.callbackFunction=UIcontroller.HeaderLoader;
	AjaxHandler.makeAjaxCall(object)
}


UIcontroller.HeaderLoader=function(response)
{
	UIcontroller.bindReponseToUi(response,"#header");
}


UIcontroller.bindReponseToUi=function(response,uiRoot)
{
	console.log(response);
	
	for (var key in response) {
	    if (response.hasOwnProperty(key)) {
	    	console.log("key "+key+" value "+response[key]);
	    	$(uiRoot+" ."+key).text(response[key]);
	       
	    }
	}
	
}

