class Reservation < ApplicationRecord

	# Associations
  belongs_to :guest
  belongs_to :table
  belongs_to :restaurant

	# Validations
  validates_presence_of :guest, :table, :restaurant, :reservation_time, presence: true

end
