
class F_square

  def initialize(url)
    @url = url
  end

  def get
    conn = Faraday.new(url: "https://www.example.com/")
    response = conn.get("v3/events/#{event_id(@url)}/?token=#{ENV['API_TOKEN']}")

    if response.success?
      normalize_response(JSON.parse response.body )
    else
      handle_error(response)
    end
  end

  private
  def normalize_response(response)
    # Create hash from response
  end

  def handle_error(response)
    # return hash of errors
  end

end