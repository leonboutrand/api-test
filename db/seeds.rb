# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[ 2, 1, 3].each do |num_rooms|
  Listing.create!(num_rooms: num_rooms)
end


[
  { listing: Listing.first, start_date: "2016-10-10", end_date: "2016-10-15" },
  { listing: Listing.first, start_date: "2016-10-16", end_date: "2016-10-20" },
  { listing: Listing.last, start_date: "2016-10-15", end_date: "2016-10-20" }
].each do |hash|
  Booking.create!(hash)
end

[
  { listing: Listing.first, start_date: "2016-10-11", end_date: "2016-10-13" },
  { listing: Listing.first, start_date: "2016-10-13", end_date: "2016-10-15" },
  { listing: Listing.first, start_date: "2016-10-16", end_date: "2016-10-20" },
  { listing: Listing.last, start_date: "2016-10-15", end_date: "2016-10-18" }
].each do |hash|
  Reservation.create!(hash)
end

[
  { listing: Listing.first, mission_type: "first_checkin", date: "2016-10-10", price: 20},
  { listing: Listing.first, mission_type: "last_checkout", date: "2016-10-15", price: 10},
  { listing: Listing.first, mission_type: "first_checkin", date: "2016-10-16", price: 20},
  { listing: Listing.first, mission_type: "last_checkout", date: "2016-10-20", price: 10},
  { listing: Listing.first, mission_type: "checkout_checkin", date: "2016-10-13", price: 20},
  { listing: Listing.last, mission_type: "first_checkin", date: "2016-10-15", price: 10},
  { listing: Listing.last, mission_type: "last_checkout", date: "2016-10-20", price: 5},
  { listing: Listing.last, mission_type: "checkout_checkin", date: "2016-10-18", price: 10}
].each do |hash|
  Mission.create!(hash)
end
