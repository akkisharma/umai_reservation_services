class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :table
  belongs_to :restaurant
end
