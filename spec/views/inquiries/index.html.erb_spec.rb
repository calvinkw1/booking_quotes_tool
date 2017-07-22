require 'rails_helper'
require 'support/factory_girl'
require 'support/database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe "inquiries/index", type: :view do
  
  before :each do
    unit = create(:unit)
    10.times do
      create(:day_price, unit: unit)
    end
    @inquiry = create(:inquiry, unit: unit)
    @inquiry.calculate_cost_of_stay
    @inquiry.save
    @inquiries = Inquiry.all
  end

  it "should show inquiry table headers" do
    visit root_path
    expect(page).to have_content('Inquiry #')
    expect(page).to have_content('Unit Name')
    expect(page).to have_content('Check In Date')
    expect(page).to have_content('Check Out Date')
    expect(page).to have_content('Nights')
    expect(page).to have_content('Adults')
    expect(page).to have_content('Children')
    expect(page).to have_content('Pets')
    expect(page).to have_content('Price')
    expect(page).to have_content('Tax')
    expect(page).to have_content('Total')
    expect(page).to have_content('Rental Site')

  end

  it "should show inquiry details" do
    visit root_path
    expect(page.status_code).to eq(200)
    expect(page).to have_content(@inquiry.id)
    expect(page).to have_content(@inquiry.unit.ad_name)
    expect(page).to have_content(@inquiry.check_in)
    expect(page).to have_content(@inquiry.check_out)
    expect(page).to have_content(@inquiry.nights)
    expect(page).to have_content(@inquiry.adults)
    expect(page).to have_content(@inquiry.price)
    expect(page).to have_content(@inquiry.tax)
    expect(page).to have_content(@inquiry.price + @inquiry.tax)
    expect(page).to have_content(@inquiry.rental_site)
  end

  it "should have a New Inquiry button" do
    visit root_path
    expect(page).to have_selector(:link_or_button, 'New Inquiry')
  end

end
