require 'rubygems'
require 'selenium-webdriver'

module OneLine
	def self.convertOneLine(script)
		return script.split.join(" ")
	end
end