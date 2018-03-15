var adminPanel={
	"root":"/Stylezone-ui",
	"adminpanel":"/adminpanel"
}

var baseUrlAdmin=adminPanel.root+adminPanel.adminpanel;

var methodType={
		"POST":"POST",
		"GET":"GET"
}

var datatype={
		"json":"json"
		
}

var contenttype={
		"url_encoding":"application/x-www-form-urlencoded; charset=UTF-8",
		"application_json":"application/json"
}


var  adminPanelSideBarUrl={
	"myprofile":baseUrlAdmin+"/getAdminDetails",
	"orders":baseUrlAdmin+"/orders",
	"stock":baseUrlAdmin+"/stocks",
	"report":baseUrlAdmin+"/report",
	"notification":baseUrlAdmin+"/notification",
	"createstaff":baseUrlAdmin+"/createstaff",
	
}

var adminPanelButtonAction={
		"saveAdmin":baseUrlAdmin+"/saveAdminuser",
		"saveBrand":baseUrlAdmin+"/brand/save",
		"fecthAllBrands":baseUrlAdmin+"/brand/all",
		"deleteBrand":baseUrlAdmin+"/brand//delete"
}
