class Booking < ApplicationRecord
  after_create :create_missions

  belongs_to :listing

  private

  def create_missions
    Mission.create!(
      listing: listing,
      mission_type: 'first_checkin',
      date: start_date,
      price: listing.num_rooms * 10
    )
    Mission.create!(
      listing: listing,
      mission_type: 'last_checkout',
      date: end_date,
      price: listing.num_rooms * 5
    )
  end
end
