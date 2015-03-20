class BusinessesController < ApplicationController

	def index
		terms = params['business']['name'].split.join('+')
		params['business']['zipcode'] = nil if params['business']['zipcode'] == ''

		# added the extra .split.join to location so it will function with a neighborhood along with postal code.
		location = params['business']['zipcode'].split.join('+') || 'New+York+City'
		results = HTTParty.get('https://api.foursquare.com/v2/venues/search?client_id=M33X4KUQHS41MLWGZGNQVBOFGU3HOZIVJDXBV5YNR2NZARDB&client_secret=IE3YZZUOE34UP1HIO2ZQC1KGZTQAXQN3HUXUW2XVDO2JGBYR&near=' + location + '&query=' + terms + '&v=20130815&intent=browse&radius=1000').to_json
		@parsed = JSON.parse(results)

	end

end





# 		************YELP*************
		
# 		search_params = {
# 			limit: 10,
# 			term: params['business']['name'],
# 			category_filter: 'restaurants,bars,cafes,icecream',
# 			radius_filter: 30000
# 		}
# 		params['business']['zipcode'] = nil if params['business']['zipcode'] == ''
# 		location = params['business']['zipcode'] || 'New York'
# 		results = Yelp.client.search(location, search_params).to_json
# 		@parsed = JSON.parse(results)

# 		@parsed['businesses'].each do |business|

# 			if business['location']['neighborhoods']
# 					business['neighborhoods'] = []
# 					business['location']['neighborhoods'].each do |neighborhood|
# 						business['neighborhoods']	<< neighborhood
# 					end
# 				business['neighborhoods'] = business['neighborhoods'].join(', ')
# 			end

# 			if business['categories']
# 					biz_array = []
# 					business['categories'].each do |category|
# 						biz_array << category[0] 
# 				end
# 				business['categories'] = biz_array.join(', ')
# 			end

# 		end

# 		@businesses = Business.all
# 	end

# 	def show
# 		results = Yelp.client.business(params[:id]).to_json
# 		@business = JSON.parse(results)
# 		@employees = Job.where(yelp_id: params[:id])
# 	end



# end
