require 'rails_helper'

describe "the add a product or review process" do
  it "adds a new product" do
    visit products_path
    fill_in 'Name', :with => 'Coffee'
    fill_in 'Cost', :with => 18.12
    fill_in 'State of origin', :with => 'Hawaii'
    click_on 'Create Product'
    expect(page).to have_content("successfully")
  end

  it "should go to the product page after creating a new one" do
    visit products_path
    fill_in 'Name', :with => 'bean juice'
    fill_in 'Cost', :with => 18.12
    fill_in 'State of origin', :with => 'Hawaii'
    click_on 'Create Product'
    expect(page).to have_content("bean juice")
  end

  it "should add a new review" do
    product = Product.create(:name => 'Tofurkey', :cost => '5.67', :state_of_origin => 'North Carolina')
    visit product_path(product)
    fill_in 'Author', :with => 'Gemini'
    fill_in 'Content body', :with => "2Repudiandae odit illo. Aliquam voluptas enim. This tofurkey is delicious. At adipisci consequatur. Beatae officia quam. O."
    fill_in 'Rating', :with => 4
    expect(page).to have_content("This tofurkey is delicious")
  end 
end
