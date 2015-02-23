require 'rubygems'
require 'selenium-webdriver'
require './NestAway.rb'
require './PrebookForm.rb'
require './library/form.rb'
require './library/onelinecode.rb'

class PreBook
	include NestAway
	include PrebookForm
	include Form
	include OneLine
end

config = {'bro'=>'android','bro_v'=>'null','os'=>'android','os_v'=>'4.2','js'=>'true', 'css'=>'true', 'ssl'=>'true','name'=>'NestAway header Test'}
prebook = PreBook.new

prebook.openUrl('http://dev.nestaway.in/tenants/new', config)

puts prebook.getMainHeading

puts prebook.getFormDescription
puts prebook.getForm
prebook.verifyPrebookForm
prebook.closeUrl()