# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mtl_unit = Unit.where(ad_name: "Montreal Beauty").first_or_create(ad_name: "Montreal Beauty", tax_percent: 0.20)
sfo_unit = Unit.where(ad_name: "San Francisco Special").first_or_create(ad_name: "San Francisco Special", tax_percent: 0.19)



Date.current.upto(10.days.from_now.to_date) do |date|
  DayPrice.create(unit: mtl_unit, date: date, price: (100 + 20*rand).round(2))
  DayPrice.create(unit: sfo_unit, date: date, price: (200 + 20*rand).round(2))
end

rental_sites = ["Booking.com", "Bookit.com", "Expedia", "Hotels.com", "Sonder", "Travelocity", "Tripadvisor", "Tripping", "Trivago", "Other"]
names = ["Calvin", "Brennan", "Ray"]
dates = Date.current.upto(7.days.from_now.to_date).to_a
10.times do |i|
  check_in = dates.sample
  check_out = check_in + Random.rand(1..3)
  inquiry = Inquiry.new(
    inquirer_name: names.sample,
    inquirer_email: "candidate@sonder.com",
    inquirer_phone: "415-555-5555",
    rental_site: rental_sites.sample,
    unit_id: Random.rand(1..2),
    adults: Random.rand(1..2),
    check_in: check_in,
    check_out: check_out
    )
  inquiry.calculate_cost_of_stay
  inquiry.save!
end