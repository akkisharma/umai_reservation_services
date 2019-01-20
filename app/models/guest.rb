class Guest < ApplicationRecord
	has_many :reservations, dependent: :destroy

	validates_presence_of :name, :email
end
