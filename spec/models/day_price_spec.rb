require 'rails_helper'
require 'support/factory_girl'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe DayPrice, type: :model do

  describe 'model validations' do

    before :each do
      unit = create(:unit)
      @day_price = create(:day_price, unit: unit)
    end

    it 'should have a date' do
      expect(@day_price.date).to be_a(Date)
    end

    it 'should have a price' do
      expect(@day_price.price).to be_a(BigDecimal)
    end

    it 'should have a unit_id' do
      expect(@day_price.unit_id).to be_a(Integer)
    end

    it 'should have a unit' do
      expect(@day_price.unit).to be_a(Unit)
    end

  end

end
