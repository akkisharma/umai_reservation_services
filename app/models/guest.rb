class Guest < ApplicationRecord

	# Associations
	has_many :reservations, dependent: :destroy, inverse_of: :guest

	# Validations
	validates_presence_of :name, :email
	validates :email, uniqueness: { case_sensitive: false }
	validates_format_of  :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Invalid email id", :on => :create

end
