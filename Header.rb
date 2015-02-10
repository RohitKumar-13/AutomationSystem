require 'rubygems'
require 'selenium-webdriver'

module Header
	def getLogo
		script = "var A = document.getElementsByclassName('logo');
			return A.children;
		"
		logo = $driver.execute_script(script)
		return logo
	end

	def getLogoLink

	end

	def getHeaderLinks
	end

	def getContactUs
	end
end