class MissionsGenerator
  def self.call
    puts "Generating missions..."

    Listing.all.each do |listing|
      listing.bookings.each do |booking|
        Mission.create(
          mission_type: "first_checkin",
          date: booking.start_date,
          price: listing.num_rooms * 10
        )
        Mission.create(
          mission_type: "last_checkout",
          date: booking.end_date,
          price: listing.num_rooms * 5
        )
      end

      listing.reservations.each do |reservation|
        Mission.create(
          mission_type: "checkin_checkout",
          date: reservation.end_date,
          price: listing.num_rooms * 10
        ) unless reservation.last_checkout_exists?
      end
      puts "Missions generated!"
    end
  end
end
