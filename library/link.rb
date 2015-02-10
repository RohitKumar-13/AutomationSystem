require 'rubygems'
require 'selenium-webdriver'
require 'net/http'

module Link
	attr_accessor :linkUrl


	def verifyLink(url)
		@linkUrl = url
		@MainWebsite = 'http://www.nestaway.in'
		@host = URI(@MainWebsite.to_s).hostname
		@port = URI(@MainWebsite.to_s).port

		req = Net::HTTP::Get.new(@linkUrl.to_s)
		
		res = Net::HTTP::start(@host, @port){|http|
            http.request(req)
    	}

		if URI(@linkUrl).hostname == @host && URI(@linkUrl).port == @port
			if res.kind_of? Net::HTTPSuccess
				return true
			else
				return false
			end
		else
			if res.to_hash.inspect.to_s.length > 0
				return true
			else
				return false
			end
		end

		return false
	end

	def hasHover
	end

	def hasFocus
	end

	def getLink
		return @linkUrl
	end

	def getLinkTargetType
	end
end