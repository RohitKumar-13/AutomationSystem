require 'rubygems'
require 'selenium-webdriver'

module Banner
	def getBanner(*args)
		if args.size == 0
			script = "var banner = document.getElementsByClassName('banner');
				var allbanner;
				if (banner.length > 1) {
					return 'Sorry there the more than one Banner class Elements please specify.'
				}
				else {

					var current = banner[0];
					
					var C = current.children;
					var Q = new Array();
					for(var i = 0; i < C.length; i++){
						Q.push(C[i]);
					}
					while(Q.length){
						var curr = Q.shift();
						var child = curr.children;
						if (child != 'undefined' || child != ''){
							for(var i = 0; i < child.length; i++){
								if(child[i].className == 'slides'){
									allbanner = child[i];
									Q.length = 0;
								} else {
									Q.push(child[i]);
								}
							}
						}
					}
				}

				var bannerlist = allbanner.children;
				if(bannerlist.length > 1){
					return 'Error: More than one banner. Need to be one Banner'
				} else {
					return bannerlist[0].className;
				}
			"
			result =  $driver.execute_script(script)


		else

		end
	end
	def getBackgroundImage
		script = "var banner = document.getElementsByClassName('banner');
			var allbanner;
			if (banner.length > 1) {
				return 'Sorry there the more than one Banner class Elements please specify.'
			}
			else {
				var curr = banner[0];
				var C = curr.currentStyle || window.getComputedStyle(curr, false);
				var imgurl = C.backgroundImage;
				if(imgurl != 'none' && imgurl[0] == 'u' || imgurl[0] == 'U'){
					if(imgurl[4] == '\"'|| imgurl[4] == \"'\"){
						return imgurl.slice(5,-2);
					} else {
						return imgurl.slice(4, -1);
					}
				}
			}
		"
		return $driver.execute_script(script);
	end
	def getBackgroundImageID
		return 'banner'
	end

	def getBigHeading
	end

	def getSmallHeading
		script = "
		var Element = document.getElementsByClassName('bannerHeadingSmall');
		if (Element.length > 1){
			return 'Error: Multiple Banner Elements. Expected one Banner';
		}
		var B = new Array();
		for (var i = 0; i < Element.length; i++){
			var curr = Element[i];

			B.push(curr.textContent);
		}
		return B;
		"
		return $driver.execute_script(script)
	end

	def getButton
		script = "
		var Element = document.getElementsByClassName('how-work-btn');
		if (Element.length > 1){
			return 'Error: Multiple Button Elements. Expected one How it Works Button';
		}
		return Element[0].textContent;
		"
		return $driver.execute_script(script)
	end

	def getToggleLink
	end
end