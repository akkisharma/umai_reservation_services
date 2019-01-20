class Table < ApplicationRecord
  belongs_to :restaurant
  belongs_to :reservation
end
