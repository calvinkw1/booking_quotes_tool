FactoryGirl.define do
  factory :inquiry do
    inquirer_name "Steph Curry"
    inquirer_email "candidate@sonder.com"
    inquirer_phone "415-555-5555"
    check_in Date.today + 2
    check_out Date.tomorrow + 3
    adults Random.rand(1..2)

    association :unit
  end
end