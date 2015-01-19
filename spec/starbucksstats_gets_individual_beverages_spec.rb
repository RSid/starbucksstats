require 'spec_helper.rb'

describe "#starbucksstats gets links for all beverages" do
  it 'gets a list of links for each individual beverage' do
    ROOT_RETURNED_URL = '/menu/beverage-list/'

    sample_list_of_actual_beverage_links = ['espresso-beverages/espresso',
    'frappuccino-blended-coffee/caramel-frappuccino-blended-beverage',
    'brewed-tea/china-green-tips-brewed-tea',
    'chocolate-beverages/vanilla-spice-hot-chocolate',
    'bottled-drinks/starbucks-bottled-coffee-frappuccino-mocha-chocolate-drink']

    beverages = Starbucksstats.get_all_beverage_links

    expect(beverages.length).to be > 0
    expect(beverages.include?(ROOT_RETURNED_URL +
    sample_list_of_actual_beverage_links[0])).to eql(true)
    expect(beverages.include?(ROOT_RETURNED_URL +
    sample_list_of_actual_beverage_links[-1])).to eql(true)
  end
end
