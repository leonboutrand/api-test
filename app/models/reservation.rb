class Reservation < ApplicationRecord
  after_create :create_missions

  belongs_to :listing

  def last_checkout_exists?
    # is not private because used in MissionGenerator
    listing.bookings.map(&:end_date).include?(end_date)
  end

  private

  def create_missions
    Mission.create!(
      listing: listing,
      mission_type: 'checkin_checkout',
      date: end_date,
      price: listing.num_rooms * 10
    ) unless last_checkout_exists?
  end
end
