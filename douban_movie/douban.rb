# douban movie

require 'open-uri'
require 'set'

class Movie
	@@MAX_COUNT = 2000

	def initialize(mid)
		@mid = mid
		@peoples = Set.new;
	end

	def search_user_in_comments(start=0)
		url = "http://movie.douban.com/subject/"+@mid.to_s+"/comments?sort=time&start="+start.to_s
		puts url
		content = open(url).read
		peoples = content.scan /http:\/\/movie\.douban\.com\/people\/(\w+)\//
		peoples = peoples.map{
			|x|
			@peoples << x[0]
			x[0]
		}
		if peoples.count > 0 and start < @@MAX_COUNT then
			search_user_in_comments start + 20
		end
	end

	def search_user_in_reviews(start=0)
		url = "http://movie.douban.com/subject/"+@mid.to_s+"/reviews?sort=time&start="+start.to_s
		puts url
		content = open(url).read
		peoples = content.scan /http:\/\/movie\.douban\.com\/people\/(\w+)\//
		peoples = peoples.map{
			|x|
			@peoples << x[0]
			x[0]
		}
		if peoples.count > 0 and start < @@MAX_COUNT then
			search_user_in_reviews start + 25
		end
	end

	def people_set
		@peoples
	end

	def intersection(another_movie)
		@peoples.intersection another_movie.people_set
	end
end

