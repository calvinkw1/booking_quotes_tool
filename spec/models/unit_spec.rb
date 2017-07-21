require 'rails_helper'
require 'support/factory_girl'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe Unit, type: :model do
  
  describe 'model validations' do

    before :all do
      @unit = create(:unit)
      @day_price = create(:day_price, unit: @unit)
    end

    it 'should have an ad name' do
      expect(@unit.ad_name).to eq("Montreal Beauty")
      expect(@unit.ad_name).to be_a(String)
    end

    it 'should have a tax percentage' do
      expect(@unit.tax_percent).to be_a(BigDecimal)
    end

    it 'should have day prices' do
      expect(@unit.day_prices).to be_truthy
      expect(@unit.day_prices.any?).to be(true)
    end

  end

end
