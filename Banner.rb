require 'rubygems'
require 'selenium-webdriver'

module Banner
	def getBackgroundImage
	end

	def getBigHeading
	end

	def getSmallHeading
		script = "
		var Element = document.getElementsByClassName('bannerHeadingSmall');
		if (Element.length > 1){
			return 'Error: Multiple Banner Elements. Expected one Banner';
		}
		return Element[0].textContent;
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