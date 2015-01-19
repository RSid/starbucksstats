require "starbucksstats/version"
require 'nokogiri'
require 'rest-client'
require 'pry'

module Starbucksstats
  ROOT_URL = "http://www.starbucks.ie/menu/"


  def self.get_beverage_types_links
    beverage_info = self.get_beverage_info

    beverage_links = []
    beverage_info.each do |bvg|
      beverage_links << bvg["href"]
    end

    beverage_links
  end

  def self.get_beverage_types
    beverage_info = self.get_beverage_info

    beverages = []
    beverage_info.each do |bvg|
      beverages << bvg.text
    end

    beverages
  end

  private

  def self.get_beverage_info
    @beverage_page = Nokogiri::HTML(RestClient.get(ROOT_URL + 'beverage-list'))
    beverage_info = @beverage_page.css('ol li dl dt a')
  end
end
