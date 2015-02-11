require 'rubygems'
require 'selenium-webdriver'

module Header
	def getLogo
		script = "var A = document.getElementById('logo_id');
			return A.src;
		"
		logo = $driver.execute_script(script)
		return logo
	end
	
	def logoId
		script = "var A = document.getElementById('logo_id');
			return A.id;
		"
		logo = $driver.execute_script(script)
		return logo
	end

	def getLogoLink
		script = "var A = document.getElementById('logo_id');
			return A.parentElement.href;
		"
		logo_link = $driver.execute_script(script)
		return logo_link
	end

	def getMenuLinks
		script = "
		var list = document.getElementById('header_menu_id');
		var links = list.children;
		var arr = new Array();
		for(var i = 0; i < links.length; i++){
			arr.push(links[i].children[0].href);
		}
		return arr;
		"
		return $driver.execute_script(script)
	end

	def getContactUs
		script = "
		var A = document.getElementsByClassName('contact-popup');
		return A[0].className;
		"
		return $driver.execute_script(script)
	end
end