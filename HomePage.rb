require 'rubygems'
require 'selenium-webdriver'
require './NestAway.rb'
require './library/link.rb'
require './library/image.rb'
require './Header.rb'
require './Banner.rb'
require './Sample.rb'
require './WhyNestaway.rb'

class HomePage
	include NestAway
	include Header
	include Banner
	include Link
	include Image
	include Sample
	include WhyNestaway
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
	result = header.isImageLoaded(logo_id, logo_url, 'ID')
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
puts "=>ContactUsPopup"
#puts header.getContactUs

#===================End Header======================#

#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\#
#----------------------------------------------------#
#\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/#

#=====================Banner========================#
puts "=>Banner"
=begin
banner = HomePage.new

url =  banner.getBackgroundImage
id = banner.getBackgroundImageID
puts url
puts id
puts banner.isImageLoaded(id, url)
=end
#===================End Banner======================#
puts "=> Thumbnail"
#===================SampleHome======================#
sample = HomePage.new
puts Sample.getMainHeading

result = sample.getSampleTile

if !result.nil?
	result.each do |sam|
		image = sam['image'];

		if header.verifyLink(image)				
			res = header.isImageLoaded('sample-tile', image, 'CLASS')
			if res
				puts "#{image} \t|Loaded Successfully|"
			else
				puts "#{image} \t|Image Not Loaded|"
			end
		else
			puts "#{image} \t|Image Not Present on Server|"
		end

		head = sam['heading']
		list = Array.new
		if sam['list'].length == 0
			puts "\n--------------------------------------------\nError : There must Be at Least one desc list item at\nimageUrl = #{image}\nHeading = #{head} \n--------------------------------------------\n\n"
		else
			list = sam['list']
		end
	end
end

link =  sample.getViewDetail
result = sample.verifyLink(link)
if result
	puts "#{link}\t\t|Working|"
else
	puts "#{link}\t\t|Not Working|"
end
#===================EndSample=======================#

#=====================Why NestAway==================#
why = HomePage.new
puts why.getMainHeading

result = why.getPoints
if !result.nil?
	i = 1
	result.each do |point|
		flag = true
		smallImg = point['content']
		if smallImg == false
			puts "ERROR: small Icon Image is not present in #{i}th point"
			flag = false;
		end
		heading = point['heading']
		paragraph = point['paragraph']
		if flag
			puts "Everything Fine in Point #{i}"
		end
		i = i+1
	end
end
#=====================End WhyNestAway===============#
header.closeUrl