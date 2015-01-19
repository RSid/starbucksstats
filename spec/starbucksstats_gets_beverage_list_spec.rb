require 'spec_helper.rb'

describe "#starbucksstats get beverage type links" do
  it 'gets a list of links to all available beverage types' do
    ROOT_RETURNED_URL = '/menu/beverage-list/'

    actual_beverages = ['bottled-drinks', 'brewed-tea', 'chocolate-beverages',
    'espresso-beverages', 'brewed-coffee', 'frappucino-blended-coffee']

    beverages = Starbucksstats.get_beverage_types_links

    expect(beverages.length).to be(actual_beverages.length)
    expect(beverages.include?(ROOT_RETURNED_URL + actual_beverages[0])).
    to eql(true)
  end
end

describe "#starbucksstats get beverage types" do
  it 'gets a list of all available beverage types' do

    actual_beverages = ['Bottled Drinks', 'Brewed Tea', 'Chocolate Beverages',
      'Espresso Beverages', 'Filter Coffee', 'Frappucino Blended Beverages']

      beverages = Starbucksstats.get_beverage_types

      expect(beverages.length).to be(actual_beverages.length)
      expect(beverages.include?(actual_beverages[0])).to eql(true)
    end
  end
