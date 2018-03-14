function UIutiles() {
}


UIutiles.getRegex = function(type) {
	switch (type) {
	case "emptystring":
		return /^\s*$/;
		break;
	}
}


UIutiles.rquiredValidator = function(object) {
	var clz = object.attr("id");
	console.log(clz);
	var ret=true;
	$("#" + clz).children("div").each(function() {
		$(this).find("input").each(function() {

			if (($(this).attr("hidden_id")) != undefined)
				console.log("hidden_id " + $(this).attr("hidden_id"));

			var id = $(this).attr("id");
			var value = $("#" + id).val();

			if (new RegExp(UIutiles.getRegex("emptystring")).test(value) && !$("#" + id).hasClass("hide")) {
				$("#" + id).addClass("error");
				$("#" + id).attr("placeholder", "Please provide " + id);
					ret=false;
			} else {
				$("#" + id).removeClass("error");
			}
		});
	});

	return ret;
}


UIutiles.makeJsonObject = function(rootClass) {
	var data = new Object();
	$(rootClass).find(".controle").each(function(index) {

		var id = $(this).attr("id");
		
		console.log("makejson object "+id );
		
		if (UIutiles.hasAttr(id, "child")) {
			var child = new Object();
			var value = $("#" + id).attr("child");
				$(rootClass).find("[child ='" + value + "']").each(function() {
					child[$(this).attr("id")] = $(this).val();
				}
			);

			data[$(this).attr("child")] = child;
		} else {

			data[id] = $("#" + id).val();
		}
	});

	return JSON.stringify(data);
}

UIutiles.bindReponseToUi = function(response, uiRoot) {

	for ( var key in response) {
		if (response.hasOwnProperty(key)) {
			if (response[key] != null) {
				if ($(uiRoot).find('.' + key).length !== 0) {

					//checking is this control type like input type

					if ($(uiRoot).find(" ." + key).hasClass("controle"))
						$(uiRoot).find(" ." + key).val(response[key]);
					else
						$(uiRoot).find(" ." + key).text(response[key]);
				}
			}
		}
	}
}

UIutiles.hasAttr = function(controler, attribute) {
	var attr = $("#" + controler).attr(attribute);

	if (typeof attr !== typeof undefined && attr !== false) {
		// Element has this attribute
		return true;
	}
	return false;

}