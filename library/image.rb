require 'rubygems'
require 'selenium-webdriver'

module Image

	def isImageBackground(id, url)
		element_id = id
		image_url = url
		script = "
		var Id = '#{element_id}';
		var Url = '#{image_url}';
		var B = new Array();
		var A = document.getElementsByTagName('*');
		for(var i = 0; i < A.length; i++){
			if((A[i].tagName == 'img' || A[i].tagName == 'IMG') && A[i].id == Id && A[i].src == Url){
				return false;
			}
		}
		return true;
		"
		return $driver.execute_script(script)
	end

	def isImageImg(id, url)
		element_id = id
		image_url = url
		script = "
		var Id = '#{element_id}';
		var Url = '#{image_url}';
		var B = new Array();
		var A = document.getElementsByTagName('*');
		for(var i = 0; i < A.length; i++){
			if((A[i].tagName == 'img' || A[i].tagName == 'IMG') && A[i].id == Id && A[i].src == Url){
				return true;
			}
		}
		return false;
		"
		return $driver.execute_script(script)
	end

	def isImageLoaded(id, url)
		if isImageBackground(id, url)
			script = "
				var result = false;
				$('<img/>').attr('src','#{url}').load(function(){result = true;});
				return result;
			"
			return $driver.execute_async_script(script)
		else
			script = "
			var A = document.getElementById('#{id}');
			return A.complete && typeof A.naturalWidth != 'undefined' && A.naturalWidth > 0;
			"
			return $driver.execute_script(script)
		end
		return false
	end

	def getImageUrl
	end

	def getImageWidth
	end

	def getImageHeight
	end

	def hasHover
	end

	def hasFocus
	end
end