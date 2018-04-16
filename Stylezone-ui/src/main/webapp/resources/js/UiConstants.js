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
	"myprofile":adminPanel.root+"/user/getDetails",
	"orders":baseUrlAdmin+"/orders",
	"stock":baseUrlAdmin+"/stocks",
	"report":baseUrlAdmin+"/report",
	"notification":baseUrlAdmin+"/notification",
	"createstaff":baseUrlAdmin+"/createstaff",
	
}

var adminPanelButtonAction={
		
		"createUser":adminPanel.root+"/register/user",
		"saveAdmin":adminPanel.root+"/user/saveUser",
		"saveBrand":baseUrlAdmin+"/brand/save",
		"fecthAllBrands":baseUrlAdmin+"/brand/all",
		"deleteBrand":baseUrlAdmin+"/brand//delete",
		
		"saveColor":baseUrlAdmin+"/color/save",
		"fecthAllColors":baseUrlAdmin+"/color/all",
		"deleteColor":baseUrlAdmin+"/color/delete",
		
		
		"saveOccasion":baseUrlAdmin+"/occasion/save",
		"fecthAllOccasion":baseUrlAdmin+"/occasion/all",
		"deleteOccasion":baseUrlAdmin+"/occasion/delete",
		
		"saveCat":baseUrlAdmin+"/cat/save",
		"fecthAllCat":baseUrlAdmin+"/cat/all",
		"deleteCat":baseUrlAdmin+"/cat/delete",
		
		
		"saveProduct":baseUrlAdmin+"/product/create",
		"fecthAllProduct":baseUrlAdmin+"/product/all",
		"deleteProduct":baseUrlAdmin+"/product/delete",
		"fetchSingleProduct":baseUrlAdmin+"/product/fetch",
		"fetchProductAttr":baseUrlAdmin+"/productDtls/fetch"
}


var user={
		"forgotPass":adminPanel.root+"/user/forgotPassword",
		"verifyOtpPass":adminPanel.root+"/user/verifyForgotPassOtp",
		"changePassword":adminPanel.root+"/user/changePassword"
		
}

var website={
		"fetchMenu":adminPanel.root+"/getMenu",
		"fetchHomePageLatest":adminPanel.root+"/getProductList",
		"fetchProducts":adminPanel.root+"/getProducts/show/",
		"addToCart":adminPanel.root+"/addToCart",
		"fetchCart":adminPanel.root+"/fetchCart"
}