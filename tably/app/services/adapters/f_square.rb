
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
  	venues = []
  	response['response']['venues'].each do |venue|
  		venues << getPhoto(venue)
  	end
  	venues
  end

  def getPhoto(venue)
    
    id = venue["id"]

  	business = Business.find_by({fs_id: id})

  	if business
  		business
  	else
	  	conn = Faraday.new(url: "https://api.foursquare.com/")
	    response = conn.get("v2/venues/#{ id }/photos?client_id=M33X4KUQHS41MLWGZGNQVBOFGU3HOZIVJDXBV5YNR2NZARDB&client_secret=IE3YZZUOE34UP1HIO2ZQC1KGZTQAXQN3HUXUW2XVDO2JGBYR&limit=1&v=20130815")
	    photo_obj = JSON.parse response.body
	    if urls = photo_obj["response"]["photos"]["items"][0]
	    	urls = photo_obj["response"]["photos"]["items"][0]
	  		url = urls["prefix"] + "200x200" + urls["suffix"]
	  	else
	  		url = 'none'
	  	end
	  	new_b = Business.create({
        fs_id: id, 
        photo: url,
        name: venue['name'],
        address: venue['location']['address'],
        phone: venue['contact']['formattedPhone']
      })
	  	new_b
	  end
  end

  def handle_error(response)
    # return hash of errors
  end

end