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
			if((A[i].tagName == 'img' || A[i].tagName == 'IMG') && A[i].src == Url){
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

	def isImageLoaded(id, url, type)
		if isImageBackground(id, url)
			script = "
				var main = function(){
					var image = docement.createElement('img');
					image.src = #{url};
					return image.src;
					/*
					image.onload = function(){
						window.alert('Loaded');
					};*/
				}

				$(document).ready(main)
			"
			return $driver.execute_script(script)
		else
			script = "
			type = '#{type}';
			if(type === 'ID') {
				var A = document.getElementById('#{id}');
				return A.complete && typeof A.naturalWidth != 'undefined' && A.naturalWidth > 0;
			} else if(type === 'CLASS') {
				var E = document.getElementsByClassName('#{id}');
				var B = new Array();
				for(var i = 0; i < E.length; i++){
    				var Q = new Array();
    				Q.push(E[i]);
    				while(Q.length > 0){
        				var curr = Q.shift();
        				for(var j = 0; j < curr.children.length; j++){
                    		var ele = curr.children[j];
            				Q.push(ele);
                    		var Tag = ele.tagName;
                    		if((Tag == 'img' || Tag == 'IMG') && ele.src == '#{url}'){
								return ele.complete && typeof ele.naturalWidth != 'undefined' && ele.naturalWidth > 0;
							}
                		}
            		}
				}
				return false;
			}
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