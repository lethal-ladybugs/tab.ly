
class F_square

  def initialize(url)
    @url = url
  end

  def get(loc, terms)
    conn = Faraday.new(url: "https://api.foursquare.com/")
    response = conn.get("v2/venues/search?client_id=M33X4KUQHS41MLWGZGNQVBOFGU3HOZIVJDXBV5YNR2NZARDB&client_secret=IE3YZZUOE34UP1HIO2ZQC1KGZTQAXQN3HUXUW2XVDO2JGBYR&v=20130815&intent=browse&radius=1000&limit=5&near=" + loc + '&query=' + terms)
    if response.success?
      normalize_response(JSON.parse response.body )
    else
      handle_error(response)
    end
  end

  private
  def normalize_response(response)
  	# normalized = {

  	# }
  	venues = []
  	response['response']['venues'].each do |venue|
  		each = {
  			name: venue['name'],
  			address: venue['location']['address'],
  			phone: venue['contact']['formattedPhone'],
  			photo: getPhoto(venue["id"])
  		}
  		venues << each
  	end
  	venues
  	# binding.pry
    # Create hash from response
  end

  def getPhoto(id)
  	conn = Faraday.new(url: "https://api.foursquare.com/")
    response = conn.get("v2/venues/#{id}/photos?client_id=M33X4KUQHS41MLWGZGNQVBOFGU3HOZIVJDXBV5YNR2NZARDB&client_secret=IE3YZZUOE34UP1HIO2ZQC1KGZTQAXQN3HUXUW2XVDO2JGBYR&limit=1&v=20130815")
    photo_obj = JSON.parse response.body
    if urls = photo_obj["response"]["photos"]["items"][0]
    	urls = photo_obj["response"]["photos"]["items"][0]
  		url = urls["prefix"] + "200x200" + urls["suffix"]
  	else
  		urls = 'error'
  	end
  end

  def handle_error(response)
    # return hash of errors
  end

end