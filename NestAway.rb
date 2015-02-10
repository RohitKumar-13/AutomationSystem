require 'rubygems'
require 'selenium-webdriver'

module NestAway
	$MainWebsite = 'www.nestaway.in'
    $currentSite
	def initialize							#default
		$caps = Selenium::WebDriver::Remote::Capabilities.new
		@config=''
		setCapabilities(@config)	
	end

	def setCapabilities(config)					#input capabilities
		$caps['browser'] = config['bro'] || 'Firefox'
		$caps['browser_version'] = config['bro_v'] || '30.0'
		$caps['os'] = config['os'] || 'windows'
		$caps['os_version'] = config['os_v'] || '7'
		$caps['javascriptEnabled'] = config['js'] || 'false'
		$caps['cssSelectorsEnabled'] = config['css'] || 'false'
		$caps['acceptSslCert'] = config['ssl'] || 'false'
		$caps['name'] = config['name']	|| 'NestAway Test'
	end

	def openUrl(*args)
		if args.size > 1
			url = args[0]
			config = args[1]
			@@currentSite = url
			setCapabilities(config)
		else
			url = args[0]
			@@currentSite = url
		end
		$driver = Selenium::WebDriver.for(:remote,:url => "http://rishav2:ZzNbRxCxJMaHy5zLxCJX@hub.browserstack.com/wd/hub",:desired_capabilities => $caps)
		$driver.navigate.to @@currentSite		#start browser and specific url
	end

	def closeUrl
		$driver.quit							#close browser and website
	end
	def getAllLinkUrl
		links = "var links = new Array(); var arr=document.links; for(var i=0;i < arr.length; i++) { links.push(arr[i].href);	} return links;"
		return $driver.execute_script(links).uniq		
	end
end
