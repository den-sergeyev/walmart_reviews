class Client
  WALMART_REVIEW_API = "http://www.walmart.com/reviews/api/product/".freeze

  def initialize(endpoint = WALMART_REVIEW_API)
    @endpoint = endpoint
  end

  def get(item_id, params)
    uri = URI("#{@endpoint}/#{item_id}")
    default_params = { sort: :relevancy, show_product: false}
    request_params = default_params.merge(params)

    uri.query = URI.encode_www_form(request_params)
    parse_json(Net::HTTP.get_response(uri).body)

    rescue StandardError => e
      Rails.logger.error("Can't fetch data via http due to: #{e.inspect}")
      {}
  end

  def parse_json(json)
    ActiveSupport::JSON.decode(json).symbolize_keys
    rescue ActiveSupport::JSON.parse_error => e
      Rails.logger.warn("Attempted to decode invalid JSON: #{e.inspect}")
  end
end
