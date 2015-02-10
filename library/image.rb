require 'rubygems'
require 'selenium-webdriver'

module Image
	attr_accessor :imageUrl

	def initialize(url)
		@imageUrl = url
	end

	def isImageBackground
	end

	def isImageImg
	end

	def isImageLoaded
	end

	def getImageUrl
	end

	def getImageWidth
	end

	def getImageHeight
	end

	def hasHover
	end

	def hasFocus
	end
end