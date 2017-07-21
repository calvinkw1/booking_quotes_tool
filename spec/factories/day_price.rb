FactoryGirl.define do
  factory :day_price do |day_price|
    day_price.sequence(:date) {|i| Date.today + i}
    price {(200).round(2)}

    association :unit
  end
end