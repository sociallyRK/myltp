class Realestate < ActiveRecord::Base
  require 'open-uri'
  before_save :generate_zestimate
  belongs_to :financialinstrument
  belongs_to :user

  def generate_zestimate
    zillow_link = "http://www.zillow.com/webservice/GetSearchResults.htm?#{ENV['ZILLOW_KEY']}&address=#{self.zipaddress}&citystatezip=#{self.zipcity}, #{self.zipstate} #{self.zipcode}"
    encoded_url = URI.encode(zillow_link)
    URI.parse(encoded_url)
    puts encoded_url
    doc = Nokogiri::HTML(open(encoded_url))
    puts "doc #{doc}"
    self.zestimate = doc.css("zestimate amount")[0].children.text.to_i
    puts "self.zestimate #{self.zestimate}"
  end

end
