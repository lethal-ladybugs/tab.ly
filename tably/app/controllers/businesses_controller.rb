class BusinessesController < ApplicationController

	def index
		terms = params['business']['name'].split.join(',')
		search_params = {
			limit: 10,
			term: params['business']['name'],
			category_filter: 'restaurants,bars,cafes,icecream',
			radius_filter: 30000
		}
		results = Yelp.client.search(params['business']['zipcode'], search_params).to_json
		@parsed = JSON.parse(results)
		@businesses = Business.all
	end

	def show
		results = Yelp.client.business(params[:id]).to_json
		@business = JSON.parse(results)
		@employees = Job.where(yelp_id: params[:id])

	end

end
