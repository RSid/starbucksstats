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

  it 'gets a list of names for each individual beverage' do

    sample_list_of_actual_beverage_links = ['Chamomile Tea',
      'Classic Hot Chocolate', 'Cappuccino',
      'Starbucks Bottled Frappuccino Mocha Chocolate Drink']

      beverages = Starbucksstats.get_all_beverages_names

      expect(beverages.length).to be > 0
      expect(beverages.include?(sample_list_of_actual_beverage_links[0])).
      to eql(true)
      expect(beverages.include?(sample_list_of_actual_beverage_links[-1])).
      to eql(true)
  end
end

describe "#starbucksstats gets link for individual beverage by name" do
  it 'gets link for individual beverage by name' do
    beverage_link = Starbucksstats.get_beverage_link('Espresso')

    expect(beverage_link).to eql('/menu/beverage-list/espresso-beverages/espresso')
  end

  it "gives a useful error for names that aren't found" do
    expect{ Starbucksstats.get_beverage_link('Esprexxo') }.to raise_error(
    ArgumentError, "Drink not found. The name must be exact.")
  end
end
