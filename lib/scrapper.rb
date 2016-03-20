require 'html_parser'
class Scrapper
  include Enumerable
  include HtmlParser

  def initialize(item_id, client)
    @item_id = item_id
    @client = client
    @data = []
  end

  def serial_scrape!
    params_array.each do |params|
      @data << @client.get(@item_id, params)
    end
  end

  def each
    @data.each {|element| yield element }
  end

  def params_array
    first_page_text = @client.get(@item_id, {limit: 10, page: 1})
    p first_page_text
    total_number = find_review_count(first_page_text)
    full_pages, reminder = total_number.divmod(10)

    params = []
    full_pages.times do |page|
      params = {limit: 10, page: page + 1}
    end

    params << {limit: 10, page: full_pages + 1} if reminder > 0
    p params
    params
  end
end
