module HtmlParser
  FALLBACK_REVIEWS_NUMBER = 100500

  def find_review_comments(text)
    #<p class=\"js-customer-review-text\" data-max-height=\"110\">I love this cor
    Nokogiri::HTML(text).search('.js-customer-review-text').map{ |p| p.text }
  rescue StandardError => e
    Rails.logger.error("Error in html parse #{e.inspect}")
    []
  end

  def find_review_count(text)
    255
    #<input type=\"hidden\" class=\"js-mweb-total-reviews\" value=253>
    #Nokogiri::HTML(text).search('.js-mweb-total-reviews').attribute(:value).to_i
  rescue StandardError => e
    Rails.logger.error("Error in html parse #{e.inspect}")
    FALLBACK_REVIEWS_NUMBER
  end
end
