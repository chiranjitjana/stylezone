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
	
	UIcontroller.loadBrandList.getInstance().ajax.reload();

}



UIcontroller.deleteBrand=function()
{
	var data = UIutiles.makeJsonObject("#deleteBrand");
	var requestObject = {};
	requestObject.container = "deleteBrand";
	requestObject.data = data;
	ServiceController.deleteBrand(requestObject);
}


UIcontroller.deleteBrandCallBack=function(responseData)
{
	UIcontroller.loadBrandList.getInstance().ajax.reload();
	if (responseData.data != null) {
		UIutiles.bindReponseToUi(responseData.data, "."
				+ responseData.container);
		$("." + responseData.container + " .message").removeClass("hide");
		$("." + responseData.container + " .message").removeClass(
				"alert-danger");
		$("." + responseData.container + "  .message")
				.addClass("alert-success");

	}  else {
		$("." + responseData.container + "  .message").removeClass("hide");
		$("." + responseData.container + "  .message").removeClass(
				"alert-success");
		$("." + responseData.container + "  .message").addClass("alert-danger");

	}
	$("." + responseData.container + "  .message .text").text(
			responseData.message);
	$("." + responseData.container + "  .message").show().delay(5000).fadeOut();
	$('#brandCreate').modal('hide');
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



//loadDataTableUsing ajax call

UIcontroller.loadBrandList = (function () {
    var instance;
 
    function createInstance() {
        var object = $('.brands #brands').DataTable({
    		"ajax":{"url":adminPanelButtonAction.fecthAllBrands,"dataSrc": ""} ,
    		"columns": [
       	  	{ "data": "brandId"},
            { "data": "brandName" },
            { "data": "createdBy" },
            { "data": "createdDate" },
            {
                "targets": -1,
                "data": null,
                "defaultContent": "<button class='btn btn-info update-btn'>Update </button>"
           	},
            {
                "targets": -1,
                "data": null,
                "defaultContent": "<button class='btn btn-danger delete-btn' >Delete </button>"
           	}
        ],
        "columnDefs": [
            {
                "targets": [0],
                "visible": false
            }
        ],
        'info': true,
        "fnDrawCallback": function () {
       	 	$(".brands .brandlistcount").text("("+this.fnSettings().fnRecordsTotal()+")");
        	}
        
    	} );
        return object;
    }
 
    return {
        getInstance: function () {
            if (!instance) {
                instance = createInstance();
            }
            return instance;
        }
    };
})();



/*UIcontroller.loadBrandList=function()
{	

	var cj=$('.brands #brands').DataTable({
		"ajax":{"url":adminPanelButtonAction.fecthAllBrands,"dataSrc": ""} ,
		"columns": [
   	  	{ "data": "brandId"},
        { "data": "brandName" },
        { "data": "createdBy" },
        { "data": "createdDate" },
        {
            "targets": -1,
            "data": null,
            "defaultContent": "<button class='btn btn-info update-btn'>Update </button>"
       	},
        {
            "targets": -1,
            "data": null,
            "defaultContent": "<button class='btn btn-danger delete-btn' >Delete </button>"
       	}
    ],
    "columnDefs": [
        {
            "targets": [0],
            "visible": false
        }
    ]
    
	} );

	return cj;
}*/




