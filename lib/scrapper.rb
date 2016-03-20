class Scrapper
  include Enumerable

  def initialize(item_id, client)
    @item_id = item_id
    @client = client
    @data = []
  end

  def serial_scrape(params_array)
    params_array.each do |params|
      @data << @client.get(@item_id, params)
    end
  end

  def each
    @data.each {|element| yield element}
  end


end
