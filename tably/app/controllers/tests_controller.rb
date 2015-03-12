class TestsController < ApplicationController

	def show
		params = { term: 'coffee,beer,food', limit: 20 }
		results = Yelp.client.search('San Francisco', params).to_json
		@parsed = JSON.parse(results)
	end

end