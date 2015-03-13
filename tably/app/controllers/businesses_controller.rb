class BusinessesController < ApplicationController

	def index
		binding.pry
		search_params = { 
			location: params['business']['zipcode']
		}
		binding.pry
		results = Yelp.client.search('San Francisco').to_json
		@parsed = JSON.parse(results)
		@businesses = Business.all
	end

	def show
		@business = Business.find_by({id: params[:id]})
	end

end
