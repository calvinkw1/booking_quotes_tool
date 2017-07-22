require 'rails_helper'
require 'support/factory_girl'
require 'support/database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

RSpec.describe Inquiry, type: :model do
  
  before :each do
    unit = create(:unit)
    10.times do
      create(:day_price, unit: unit)
    end
    @inquiry = build(:inquiry, unit: unit)
    @inquiry.calculate_cost_of_stay
    @inquiry.save
  end

  describe "model validations" do

    it "should have a unit" do
      expect(@inquiry.unit_id).to be_a(Integer)
      expect(@inquiry.unit).to be_a(Unit)
    end

    it "should validate adults" do
      expect(@inquiry.adults).to be_truthy
      expect(@inquiry.adults).to be_a(Integer)
    end

    it "should validate check_in date" do
      expect(@inquiry.check_in).to be_truthy
      expect(@inquiry.check_in).to be_a(Date)
    end

    it "should validate check_out date" do
      expect(@inquiry.check_out).to be_truthy
      expect(@inquiry.check_out).to be_a(Date)
      (@inquiry.check_out).should be > @inquiry.check_in
    end

    it "should validate inquirer name" do
      expect(@inquiry.inquirer_name).to be_truthy
    end

    it "should validate inquirer email" do
      expect(@inquiry.inquirer_email).to be_truthy
      expect(@inquiry.inquirer_email).to match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
    end

    it "should validate inquirer phone" do
      expect(@inquiry.inquirer_phone).to be_truthy
      expect(@inquiry.inquirer_phone).to match(/\d{3}-\d{3}-\d{4}/)
    end

  end

  describe '#calculate_cost_of_stay' do
    context 'set inquiry object values for pricing' do

      context '#count_nights' do
        it 'should set the number of nights' do
          expect(@inquiry.nights).to be_a(Integer)
        end
      end
        
      context '#cost_per_night' do
        it 'should calculate price based on number of nights' do
          expect(@inquiry.price).to be_a(BigDecimal)
        end

        it 'should calculate tax' do
          expect(@inquiry.tax).to be_a(BigDecimal)
        end
      end

      it 'should be able to calculate total price' do
        expect(@inquiry.price + @inquiry.tax).to be_a(BigDecimal)
      end
      
    end
  end
end
