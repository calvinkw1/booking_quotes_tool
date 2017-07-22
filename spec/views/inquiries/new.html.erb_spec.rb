require 'rails_helper'
require 'support/factory_girl'
require 'support/database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe "inquiries/new", type: :view do

  before :each do
    @unit = create(:unit)
    10.times do
      create(:day_price, unit: @unit)
    end
    @inquiry = build(:inquiry, unit: @unit)
  end

  it "renders new inquiry form" do
    visit root_path
    click_button 'New Inquiry'

    expect(page).to have_content("Submit New Inquiry")
    expect(page).to have_content("Inquirer name")
    expect(page).to have_content("Inquirer email")
    expect(page).to have_content("Inquirer phone")
    expect(page).to have_content("Check in")
    expect(page).to have_content("Check out")
    expect(page).to have_content("Adults")
    expect(page).to have_content("Children")
    expect(page).to have_content("Pets")
    expect(page).to have_content("Select a unit:")
    expect(page).to have_content(@unit.ad_name)
    expect(page).to have_content("Rental site")
    expect(page).to have_selector(:link_or_button, 'Create Inquiry')
  end

  it "submits a properly completed form" do
    visit root_path
    click_button 'New Inquiry'

    within('form') do
      fill_in 'inquiry[inquirer_name]', with: 'Steph Curry'
      fill_in 'inquiry[inquirer_email]', with: 'candidate@sonder.com'
      fill_in 'inquiry[inquirer_phone]', with: '650-388-8988'
      fill_in 'inquiry[check_in]', with: Date.tomorrow
      fill_in 'inquiry[check_out]', with: Date.tomorrow + 2
      select "2", from: "inquiry[adults]"
      page.choose 'inquiry[unit_id]'
      select "Sonder", from: "inquiry[rental_site]"

      click_button 'Create Inquiry'      
    end
    expect(page.html).to have_content('Inquiry was successfully created.')
    DatabaseCleaner.clean
  end

  it "attempts form submission with failed validations" do
    visit root_path
    click_button 'New Inquiry'

    within('form') do
      fill_in 'inquiry[inquirer_name]', with: ''
      fill_in 'inquiry[inquirer_email]', with: 'asdf'
      fill_in 'inquiry[inquirer_phone]', with: '4155555555'
      fill_in 'inquiry[check_in]', with: Date.tomorrow + 4
      fill_in 'inquiry[check_out]', with: Date.tomorrow
      page.choose 'inquiry[unit_id]'
      select "Sonder", from: "inquiry[rental_site]"

      click_button 'Create Inquiry'
    end
    expect(page.html).to have_content("Check out must be after #{Date.tomorrow + 4}")
    expect(page.html).to have_content("Inquirer email format must be example@sonder.com")
    expect(page.html).to have_content("Inquirer phone format must be 415-555-5555")
  end

end
