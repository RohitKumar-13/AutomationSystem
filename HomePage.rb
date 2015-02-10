require 'rubygems'
require 'selenium-webdriver'
require './NestAway.rb'
require './library/link.rb'
require './Header.rb'

class HomePage
	include Link
	include NestAway
	include Header
end

config = {'bro'=>'Chrome','bro_v'=>'39.0','os'=>'windows','os_v'=>'8','js'=>'true', 'css'=>'true', 'ssl'=>'true','name'=>'NestAway header Test'}
header = HomePage.new()

header.openUrl('http://www.nestaway.in', config)

logo = header.getLogo
puts logo
header.closeUrl