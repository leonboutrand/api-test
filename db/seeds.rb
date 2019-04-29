# from hostnfly/jobs file

input = {
  "listings": [
    { "id": 1, "num_rooms": 2 },
    { "id": 2, "num_rooms": 1 },
    { "id": 3, "num_rooms": 3 }
  ],
  "bookings": [
    { "id": 1, "listing_id": 1, "start_date": "2016-10-10", "end_date": "2016-10-15" },
    { "id": 2, "listing_id": 1, "start_date": "2016-10-16", "end_date": "2016-10-20" },
    { "id": 3, "listing_id": 2, "start_date": "2016-10-15", "end_date": "2016-10-20" }
  ],
  "reservations": [
    { "id": 1, "listing_id": 1, "start_date": "2016-10-11", "end_date": "2016-10-13" },
    { "id": 1, "listing_id": 1, "start_date": "2016-10-13", "end_date": "2016-10-15" },
    { "id": 1, "listing_id": 1, "start_date": "2016-10-16", "end_date": "2016-10-20" },
    { "id": 3, "listing_id": 2, "start_date": "2016-10-15", "end_date": "2016-10-18" }
  ]
}

puts 'Emptying database'
Listing.destroy_all
puts 'Database empty'

puts "\n\n#{Listing.count} listings,
      #{Booking.count} bookings,
      #{Reservation.count} reservations,
      #{Mission.count} missions\n\n"

puts 'Creating listings'
input[:listings].each { |attributes| Listing.create!(attributes) }
puts 'Listings created'

puts 'Creating bookings'
input[:bookings].each { |attributes| Booking.create!(attributes.except(:id)) }
puts 'Bookings created'

puts 'Creating reservations'
input[:reservations].each { |attributes| Reservation.create!(attributes.except(:id)) }
puts 'Reservations created'

puts "\n\n#{Listing.count} listings,
      #{Booking.count} bookings,
      #{Reservation.count} reservations,
      #{Mission.count} missions\n\n"
