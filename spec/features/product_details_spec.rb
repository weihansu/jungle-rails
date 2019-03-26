require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visit product details page" do
    # ACT
    visit root_path
    # click_on "Details »"
    first(:link, "Details »").click
    expect(page).to have_css '.main-img'
    # puts page.html
    # DEBUG / VERIFY
    save_screenshot
  end

end