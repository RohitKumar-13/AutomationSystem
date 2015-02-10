require 'rubygems'
require 'selenium-webdriver'
require './NestAway.rb'
require './library/link.rb'
class Header
	include Link
	include NestAway

	attr_accessor :@MainwWebsite = 'http://www.nestaway.com/'
	
	def initialize							#default
		@MainwWebsite = 'http://www.nestaway.in'
		@caps = Selenium::WebDriver::Remote::Capabilities.new
		@config=''
		setCapabilities(@config)	
	end

	def setConfig(config)
		@caps = Selenium::WebDriver::Remote::Capabilities.new
		setCapabilities(@config)
	end

	def setCapabilities(config)					#input capabilities
		@caps['browser'] = config['bro'] || 'Firefox'
		@caps['browser_version'] = config['bro_v'] || '30.0'
		@caps['os'] = config['os'] || 'windows'
		@caps['os_version'] = config['os_v'] || '7'
		@caps['javascriptEnabled'] = config['js'] || 'false'
		@caps['cssSelectorsEnabled'] = config['css'] || 'false'
		@caps['acceptSslCert'] = config['ssl'] || 'false'
		@caps['name'] = config['name']	|| 'NestAway Test'
	end

	#def openUrl
	#	@driver = Selenium::WebDriver.for(:remote,:url => "http://rishav2:ZzNbRxCxJMaHy5zLxCJX@hub.browserstack.com/wd/hub",:desired_capabilities => @caps)
	#	@driver.navigate.to @MainwWebsite		#start browser and website
	#end

	def openUrl(url)
		@MainwWebsite = url
		@driver.navigate.to @MainwWebsite		#start browser and specific url
	end

	def closeUrl
		@driver.quit							#close browser and website
	end

	def mainWebsite
		@MainwWebsite
	end
end

config = Hash.new('bro'=>'Chrome','bro_v'=>'39.0','os'=>'windows','os_v'=>'8','js'=>'true', 'css'=>'true', 'ssl'=>'true','name'=>'NestAway header Test')
header = Header.new()
puts header.caps
header.setConfig(config)
puts header.mainWebsite
header.openUrl('http://www.nestaway.in')
puts header.getAllLinkUrl
puts header.verifyLink('http://www.google.com')
puts header.getLink
header.closeUrl