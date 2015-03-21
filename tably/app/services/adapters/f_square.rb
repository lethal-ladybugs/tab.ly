
class F_square

  def initialize(url)
    @url = url
  end

  def get(loc, terms)
    conn = Faraday.new(url: "https://api.foursquare.com/")
    response = conn.get("v2/venues/search?client_id=M33X4KUQHS41MLWGZGNQVBOFGU3HOZIVJDXBV5YNR2NZARDB&client_secret=IE3YZZUOE34UP1HIO2ZQC1KGZTQAXQN3HUXUW2XVDO2JGBYR&v=20130815&intent=browse&radius=1000&near=" + loc + '&query=' + terms)
    if response.success?
      normalize_response(JSON.parse response.body )
    else
      handle_error(response)
    end
  end

  private
  def normalize_response(response)
  	response
  	binding.pry
    # Create hash from response
  end

  def handle_error(response)
    # return hash of errors
  end

end