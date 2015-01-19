require "starbucksstats/version"
require 'nokogiri'
require 'rest-client'
require 'pry'

module Starbucksstats
  ROOT_URL = "http://www.starbucks.ie"
  MENU_URL = "/menu/"


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

  def self.get_all_beverage_links
    beverage_type_links = self.get_beverage_types_links

    beverage_links = []

    beverage_type_links.each do |beverage_type_link|
      beverage_info = self.get_individual_beverage_info(beverage_type_link)

      beverage_info.each do |bvg|
        self.is_menu_item?(bvg) ? beverage_links << bvg["href"] : "pass"
      end
    end
    beverage_links
  end

  def self.get_all_beverages_names
    beverage_type_links = self.get_beverage_types_links

    beverage_names = []

    beverage_type_links.each do |beverage_type_link|
      beverage_info = self.get_individual_beverage_info(beverage_type_link)

      beverage_info.each do |bvg|
        self.is_menu_item?(bvg) ? beverage_names << bvg.text.strip : "pass"
      end
    end
    beverage_names
  end

  def self.get_beverage_link(drink_name)
    beverage_type_links = self.get_beverage_types_links

    beverage_names = []

    beverage_type_links.each do |beverage_type_link|
      beverage_info = self.get_individual_beverage_info(beverage_type_link)

      beverage_info.each do |bvg|
        if bvg.text.strip == drink_name
          return bvg["href"]
        end
      end
    end
    raise ArgumentError, "Drink not found. The name must be exact."
  end

  def self.get_nutritional_info(drink_name)

  end

  private

  def self.is_menu_item?(info)
    info["href"].include? MENU_URL
  end

  def self.get_individual_beverage_info(beverage_type_link)
    @page_of_beverages_in_category = Nokogiri::HTML(RestClient.get(ROOT_URL + beverage_type_link))
    beverage_info = @page_of_beverages_in_category.css('body div div div ol li a')
  end

  def self.get_beverage_info
    @beverage_page = Nokogiri::HTML(RestClient.get(ROOT_URL + MENU_URL + 'beverage-list'))
    beverage_info = @beverage_page.css('ol li dl dt a')
  end
end
