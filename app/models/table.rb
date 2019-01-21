class Table < ApplicationRecord

	# Associations
	has_many :reservations
  belongs_to :restaurant

	# Validations
	validates_presence_of :name, :min_guest, :max_guest, :restaurant

end