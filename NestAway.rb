require 'rubygems'
require 'selenium-webdriver'

module NestAway
	
	def getAllLinkUrl
		links = "var links = new Array(); var arr=document.links; for(var i=0;i < arr.length; i++) { links.push(arr[i].href);	} return links;"
		return @driver.execute_script(links).uniq		
	end
end
