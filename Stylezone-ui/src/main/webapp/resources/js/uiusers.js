function UIWebsite() {
}

//calling ajax for all menu
UIWebsite.loadMenMenu = function(type, container) {
	var fetchAllMenu = website.fetchMenu;
	var data = {
		"gender" : type
	};

	var object = {};
	object.url = fetchAllMenu;
	object.methodtype = methodType.POST;
	object.data = data;
	object.container = container;
	object.contenttype = contenttype.url_encoding;

	if (type === "M") {
		object.callbackFunction = UIWebsite.loadMenuMenCallBack;
	} else {
		object.callbackFunction = UIWebsite.loadMenuWomenCallBack;
	}
	object.callbackFuntionParameter = null;
	AjaxHandler.makeAjaxCall(object)
}


//if calling type is men then this callback function is called
UIWebsite.loadMenuMenCallBack = function(responseData) {
	var data=responseData.data;
	
	
	var categoryDiv=$(".menlist .category_list");
	var catList=data.categoryList;
	UIWebsite.loadCat(categoryDiv,catList);
	
	
	var brandDiv=$(".menlist .brand_list");	
	var brandList=data.brandList;
	UIWebsite.loadBrand(brandDiv,brandList);
	
	var occasionDiv=$(".menlist .occasion_list");
	var occasionList=data.occasionList;
	UIWebsite.loadOcassion(occasionDiv,occasionList);
	
	var categorySideBarDiv=$(".mens_sidebar .categories");
	UIWebsite.loadCatSideBar(categorySideBarDiv,catList);
}


//if calling type is women then this callback function is called
UIWebsite.loadMenuWomenCallBack = function(responseData) {
	var data=responseData.data;
	
	var categoryDiv=$(".womenlist .category_list");	
	var catList=data.categoryList;
	UIWebsite.loadCat(categoryDiv,catList)

	var brandDiv=$(".womenlist .brand_list");	
	var brandList=data.brandList;
	UIWebsite.loadBrand(brandDiv,brandList);
	
	
	var occasionDiv=$(".womenlist .occasion_list");
	var occasionList=data.occasionList;
	UIWebsite.loadOcassion(occasionDiv,occasionList);
	
	
	var colorDiv=$(".womenlist .color_list");
	var colorList=data.colorList;
	UIWebsite.loadColor(colorDiv,colorList);
	
	
	var categorySideBarDiv=$(".womens_sidebar .categories");
	UIWebsite.loadCatSideBar(categorySideBarDiv,catList);
}


//load category
UIWebsite.loadCat=function(categoryDiv,cat)
{
	for(var x=0;x<cat.length;x++)
	{
		var localAnchor=$("<a></a>");
		localAnchor.text(cat[x].catName);
		localAnchor.attr("href",adminPanel.root+"/getProducts/cat/"+cat[x].catId);
		categoryDiv.append(localAnchor);
	}
}

//load brand
UIWebsite.loadBrand=function(brandDiv,brand)
{
	for(var x=0;x<brand.length;x++)
	{
		var localAnchor=$("<a></a>");
		localAnchor.text(brand[x].brandName);
		localAnchor.attr("href",adminPanel.root+"/getProducts/brand/"+brand[x].brandId);
		brandDiv.append(localAnchor);
	}
}

//load occasion
UIWebsite.loadOcassion=function(occasionDiv,occasion)
{
	for(var x=0;x<occasion.length;x++)
	{
		var localAnchor=$("<a></a>");
		localAnchor.text(occasion[x].occasionName);
		localAnchor.attr("href",adminPanel.root+"/getProducts/occasion/"+occasion[x].occasionId);
		occasionDiv.append(localAnchor);
	}
}

//load color
UIWebsite.loadColor=function(colorDiv,color)
{
	for(var x=0;x<color.length;x++)
	{
		var localAnchor=$("<a></a>");
		localAnchor.text(color[x].colorName);
		localAnchor.attr("href",adminPanel.root+"/getProducts/color/"+color[x].colorId);
		colorDiv.append(localAnchor);
	}
}


//category side bar
UIWebsite.loadCatSideBar=function(categoryDiv,cat)
{
	for(var x=0;x<cat.length;x++)
	{
		var li=$("<li></li>");
		var localAnchor=$("<a></a>");
		localAnchor.text(cat[x].catName);
		localAnchor.attr("href",adminPanel.root+"/getProducts/cat/"+cat[x].catId);
		li.append(localAnchor);
		categoryDiv.append(li);
	}
}