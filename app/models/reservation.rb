class Reservation < ApplicationRecord
  after_create :create_missions

  belongs_to :listing

  def last_checkout_exists?
    listing.bookings.map(&:end_date).include?(end_date)
  end
end
