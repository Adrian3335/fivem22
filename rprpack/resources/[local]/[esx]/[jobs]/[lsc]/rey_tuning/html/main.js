$(function() {
  	let backspaceUsed = false;
  	let path = [];

  	let scrollToSelected = function(){
		$( ".categories" ).scrollTop($(".selected").offset().top - $( ".categories" ).offset().top + $( ".categories" ).scrollTop());
  	}

  	let keyUsage = function(data){
		if (data.key == 172 || data.key == 173 || data.key == 180 || data.key == 181) { // up || down
	  		let elements = $(".categories" ).find(".listElement");
	  		for (var i = 0; i < elements.length; i++) {
				if($(elements[i]).hasClass("selected")){
		  			let newi = 0
		  			if (data.key == 172 || data.key == 181) {
						newi = i - 1
						if (newi < 0) {
			  				newi = elements.length - 1;
						}
		 			} else {
						newi = i + 1
						if (newi > elements.length - 1) {
			  				newi = 0;
						}
		 			}
		  			
					$(elements[i]).removeClass("selected");
		  			$(elements[newi]).addClass("selected");

		 			scrollToSelected();

		  			let element = elements[newi];
		  			$.post('https://rey_tuning/changeVehicleUpgrade', JSON.stringify({ 
						name: $(element).attr('name'),
						type: $(element).attr('type'),
						mod: $(element).attr('mod'),
						modtype: $(element).attr('modtype'),
						price: $(element).attr('price'),
						labour: $(element).attr('labour'),
					}));
		 		 	break;
				}
	  		}
		} else if(data.key == 191 || data.key == 175 || data.key == 69) { // enter, right
	  		let element = $(".categories" ).find(".selected");
	  		let isEmpty = $(element).attr('empty') === 'undefined' || $(element).attr('empty') == 'true'; 
	  		let isInstalled = $(element).attr('installed') === 'undefined' || $(element).attr('installed') == 'true'; 
	  		if (!isEmpty && !isInstalled) {
				if ($(element).attr('type') === 'submenu') {
		  			path.push($(element).index());
				}
				$.post('https://rey_tuning/selectMenu', JSON.stringify({ 
					name: $(element).attr('name'),
					type: $(element).attr('type'),
					mod: $(element).attr('mod'),
					modtype: $(element).attr('modtype'),
					price: $(element).attr('price'),
					labour: $(element).attr('labour'),
					owned: $(element).attr('owned'),
		  		}));
	  		}
		} else if(data.key == 177 || data.key == 174) { // backspace, 174
	 		backspaceUsed = true
	  		$.post('https://rey_tuning/backspaceMenu');
		}
  	};
  
  	let loadMenuData = function(menuData) {
		let data = menuData.data;
		let name = menuData.name;
		$('.title').text(name);
		$('.categories').html('');
		let isFirst = true;
		let lastIndex = 0
		let lastPath;
		if (backspaceUsed) {
	  		isFirst = false
	  		lastIndex = path.pop();
		}
		$(data).each(function(index, item) {
			let isSelected = index == lastIndex || isFirst
			if (menuData.isItemSelect) {
				isSelected = item.isInstalled
			}
	 		if (isSelected) {
				$.post('https://rey_tuning/changeVehicleUpgrade', JSON.stringify({ 
					name: item.name,
					type: item.type,
					mod: item.mod,
					modtype: item.modtype,
					price: item.price,
					labour: item.labour,
		  		}));
	 		}
			$('.categories').append(
				'<div class="listElement'+(isSelected?' selected':'')+(item.isEmpty?' font-red ':'')+'"'
				+ ' name="'+item.name+'"'
				+ ' type="'+item.type+'"'
				+ ' mod="'+item.mod+'"'
				+ ' empty="'+item.isEmpty+'"'
				+ ' owned="'+item.isOwned+'"'
				+ ' modtype="'+item.modtype+'"'
				+ ' labour="'+item.labour+'"'
				+ ' price="'+item.price+'">'
				+'<div class="inline">'+item.name+'</div>'
				+'<div class="right-box">'
					+ (item.isOwned ? '(OWNED)' : item.isInstalled ? '(INSTALLED)' : 
					'<div class="inline price-box">' + (item.price > 0 ? ' ' + '<span class="dolarsign">$ </span>' + item.price : '') + '</div>'
					+((typeof item.price == 'undefined' || item.price == 0) && !item.isEmpty?'<div class="inline nav-arrow">></div>':''))
				+'</div>'
				+'</div>'
			);
			if (isSelected) {
				scrollToSelected();
			}
	  		isFirst = false
	  		backspaceUsed = false
		});
  	};

  	let loadShoppingCart = function(data) {
		$('.cart').html('');
		let labour = 0;
		let price = 0;
		$(data).each(function(index, item) {
	  		if (item.labour === 'undefined') {
				item.labour = 0;
	  		}
			if (item.price === 'undefined') {
				item.price = 0;
			}
	  		labour = labour + parseInt(item.labour);
	  		price = price + parseInt(item.price);
			$('.cart').append('<div class="cartitem">'
				+'<div class="catname">'+ item.catname +'</div>'
				+'<div class="label">'+ item.name +'</div><div class="price"><span class="dolarsign">$ </span>'+ item.price +'</div>'
				+'</div>')
		});
		price = price + labour;
		$('.cart').append(
			'<div>'
			+'<div class="separator"></div>'
			+'<div class="labour-sum-box"><span class="label"><b>Robocizna:</b></span><span class="price"><span class="dolarsign">$ </span>'+ labour +'</div>'
			+'<div class="separator"></div>'
			+'<div class="price-sum-box"><span class="label"><b>Razem:</b></span><span class="price"><span class="dolarsign">$ </span>'+ price +'</div>'
		+'</div>')
	};

	$("#main").hide();
	$(".cart").hide();
	
	window.addEventListener('message', function(event){
		if(event.data.type == "show") {
			backspaceUsed = false;
			path = [];
			$("#main").show();
			$(".cart").show();
		} else if(event.data.type == "close") {
			$("#main").hide();
			$(".cart").hide();
		} else if(event.data.type == "loadNearPlayers") {
			finalize(event.data);
		} else if(event.data.type == "loadMenuData") {
		  	loadMenuData(event.data);
		} else if(event.data.type == "loadShoppingCart") {
			loadShoppingCart(event.data.data);
		} else if(event.data.type == "keyUsage") {
		  	keyUsage(event.data);
		} else if(event.data.type == "hide") {
			$("#main").hide();
			$(".cart").hide();
		}
	});
})