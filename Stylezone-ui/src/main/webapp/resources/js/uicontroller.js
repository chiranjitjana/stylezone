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
	
	UIutiles.handleReponse(responseData);
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
	UIutiles.handleReponse(responseData);
	$('#deleteBrand').modal('hide');
}






UIcontroller.addColor=function()
{
	var data = UIutiles.makeJsonObject(".colorform");
	var requestObject = {};
	requestObject.container = "colorform";
	requestObject.data = data;
	ServiceController.addColor(requestObject);
}




UIcontroller.addColorCallback=function(responseData)
{
	UIutiles.handleReponse(responseData);
	UIcontroller.loadColorList.getInstance().ajax.reload();
}


UIcontroller.deleteColor=function()
{
	var data = UIutiles.makeJsonObject("#deleteColor");
	var requestObject = {};
	requestObject.container = "deleteColor";
	requestObject.data = data;
	ServiceController.deleteColor(requestObject);
}


UIcontroller.deleteColorCallBack=function(responseData)
{
	UIcontroller.loadColorList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	$('#deleteColor').modal('hide');
}





UIcontroller.addOcasions=function()
{
	var data = UIutiles.makeJsonObject(".occasionform");
	var requestObject = {};
	requestObject.container = "occasionform";
	requestObject.data = data;
	ServiceController.addOccasion(requestObject);
}


UIcontroller.addOcassionCallBack=function(responseData)
{
	UIcontroller.loadOccasionList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
}


UIcontroller.deleteOccasion=function()
{
	var data = UIutiles.makeJsonObject("#deleteOccasion");
	var requestObject = {};
	requestObject.container = "deleteOccasion";
	requestObject.data = data;
	ServiceController.deleteOccasion(requestObject);
}


UIcontroller.deleteOccasionCallBack=function(responseData)
{
	UIcontroller.loadOccasionList.getInstance().ajax.reload();
	UIutiles.handleReponse(responseData);
	$('#deleteOccasion').modal('hide');
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


UIcontroller.loadColorList = (function () {
    var instance;
 
    function createInstance() {
        var object = $('.colors  #colors').DataTable({
    		"ajax":{"url":adminPanelButtonAction.fecthAllColors,"dataSrc": ""} ,
    		"columns": [
       	  	{ "data": "colorId"},
            { "data": "colorCode" },
            {
                "className":'details-control',
                "orderable":false,
                "data":null,
                "render": function ( data, type, row, meta ) {
                    return "<div style='height:30px;width:30px;background-color:#"+row.colorCode+"'></div>"
                  }
            },
            { "data": "colorName" },
            { "data": "createdDate" },
            { "data": "createdBy" },
           
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
       	 	$(".colors .colorlistcount").text("("+this.fnSettings().fnRecordsTotal()+")");
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


UIcontroller.loadOccasionList=(function () {
    var instance;
 
    function createInstance() {
        var object = $('.occasions  #occasions').DataTable({
    		"ajax":{"url":adminPanelButtonAction.fecthAllOccasion,"dataSrc": ""} ,
    		"columns": [
       	  	{ "data": "occasionId"},
            { "data": "occasionName" },
            { "data": "createdDate" },
            { "data": "createdBy" },
           
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
       	 	$(".occasions .occasionlistcount").text("("+this.fnSettings().fnRecordsTotal()+")");
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

