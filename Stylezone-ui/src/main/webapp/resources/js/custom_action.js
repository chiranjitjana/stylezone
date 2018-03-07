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
			/*console.log("id "+$(this).attr("id"));
			console.log("value "+);*/
		});
	});
	
	
	return false;
}