class Inquiry < ApplicationRecord
  belongs_to :unit
  validates_presence_of :adults
  validates_presence_of :check_in
  validates_presence_of :rental_site
  validates :check_out, presence: true, date: {after: :check_in}
  validates_presence_of :inquirer_name
  validates_presence_of :inquirer_email
  validates_presence_of :inquirer_phone
  validates_format_of :inquirer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, message: "format must be example@sonder.com"
  validates_format_of :inquirer_phone, with: /\d{3}-\d{3}-\d{4}/, message: "format must be 415-555-5555"


  def calculate_cost_of_stay
    unit = self.unit
    unit_day_prices = unit.day_prices
    
    self.nights = self.count_nights
    self.price = self.cost_per_night unit_day_prices
    self.tax = self.price * unit.tax_percent
  end

  def count_nights
    (self.check_out - self.check_in).to_i
  end

  def cost_per_night day_prices
    price_per_night = {}
    (self.check_in..self.check_out).each do |day|
      price_per_night[day.to_s] = day_prices.find_by(date:day).price
    end
    price_per_night.values.reduce(:+)
  end

end
