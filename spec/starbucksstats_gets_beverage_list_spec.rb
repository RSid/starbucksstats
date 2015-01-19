require 'spec_helper.rb'

describe "#starbucksstats get beverage types" do
  it 'gets a list of all available beverage types' do
    actual_beverages = ['bottled-drinks', 'brewed-tea', 'chocolate-beverages',
    'espresso-beverages', 'brewed-coffee', 'frappucino-blended-coffee']

    beverages = Starbucksstats.get_beverage_types

    expect(beverages.length).to be(actual_beverages.length)
    expect(beverages).include?(actual_beverages[0]).to eql(true)
  end
end
