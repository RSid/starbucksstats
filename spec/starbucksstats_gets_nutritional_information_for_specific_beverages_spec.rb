require 'spec_helper.rb'

describe "#starbucksstats gets nutritional information for individual beverages" do
  it "gets a pdf with an individual beverages' nutritional data" do

    pdf_string = Starbucksstats.get_all_nutritional_info('Espresso')

    expect(pdf_string.include?('Venti')).to be(true)
  end
end
