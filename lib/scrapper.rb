class Scrapper
  def initialize(item_id, client)
    @item_id = item_id
    @client = client
  end

  def serial_scrape(params_array, &block)
    params_array.each do |params|
      response = @client.get(@item_id, params)
      block.call(response)
    end
  end
end
