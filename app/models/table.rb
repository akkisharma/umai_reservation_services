class Table < ApplicationRecord

	has_many :reservations
  belongs_to :restaurant

	validates_presence_of :name, :min_guest, :max_guest, :restaurant

end