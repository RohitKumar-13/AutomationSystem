require 'rubygems'
require 'selenium-webdriver'
require './NestAway.rb'
require './library/link.rb'
require './library/image.rb'
require './Header.rb'
require './Banner.rb'

class HomePage
	include NestAway
	include Header
	include Banner
	include Link
	include Image
end

config = {'bro'=>'Chrome','bro_v'=>'39.0','os'=>'windows','os_v'=>'8','js'=>'true', 'css'=>'true', 'ssl'=>'true','name'=>'NestAway header Test'}


#====================Header=========================#
header = HomePage.new()

header.openUrl('http://dev.nestaway.in', config)

# => NestAway Logo Link
logolink = header.getLogoLink
result = header.verifyLink(logolink)
if result
	puts "#{logolink}\t\t|Working|"
else
	puts "#{logolink}\t\t|Not Working|"
end


# => NestAway logo Image
logo_url = header.getLogo

if header.verifyLink(logo_url)				
	logo_id = header.logoId
	result = header.isImageLoaded(logo_id, logo_url)
	if result
		puts "#{logo_url} \t|Loaded Successfully|"
	else
		puts "#{logo_url} \t|Image Not Loaded|"
	end
else
	puts "#{logo_url} \t|Image Not Present on Server|"
end


# => NestAway Menu
menu_links = header.getMenuLinks
if !menu_links.nil?
	menu_links.each do |link|
		result = header.verifyLink(logolink)
		if result
			puts "#{link}\t\t|Working|"
		else
			puts "#{link}\t\t|Not Working|"
		end
	end
else
	puts "LOL!! . There is no menu in header"
end


# => NestAway Contact-Popup
puts header.getContactUs
#===================End Header======================#

#=====================Banner========================#
banner = HomePage.new
puts banner.getSmallHeading
puts banner.getButton
#===================End Banner======================#
header.closeUrl