class Restaurant < ApplicationRecord

	# Callbacks
	before_save :set_defaults

	# Associations
	has_many :tables, dependent: :destroy

	# Validations
	validates :phone, length: { in: 10..15 }
	validates_presence_of :name, :phone, :email,
												:morning_shift_start, :morning_shift_end,
												:night_shift_start, :night_shift_end, :latitude, :longitude

	validates :email, uniqueness: { case_sensitive: false }
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Invalid email id", :on => :create
  validate :end_must_be_after_start

  def convert_restaurant_shift_time_in_todays_format
  	todays_date_string = Time.now.strftime('%d %b, %Y')
  	parsed_restaurant_shift_time = {}
  	parsed_restaurant_shift_time[:morning_start_shift] = Time.parse("#{todays_date_string} #{self.morning_shift_start.strftime('%I:%M%p')}")
	  parsed_restaurant_shift_time[:morning_end_shift]   = Time.parse("#{todays_date_string} #{self.morning_shift_end.strftime('%I:%M%p')}")
	  parsed_restaurant_shift_time[:night_start_shift]   = Time.parse("#{todays_date_string} #{self.night_shift_start.strftime('%I:%M%p')}")
	  parsed_restaurant_shift_time[:night_end_shift]     = Time.parse("#{todays_date_string} #{self.night_shift_end.strftime('%I:%M%p')}")
	  parsed_restaurant_shift_time
  end

  private

  def end_must_be_after_start
  	error_msg = "time must be after shift start time"
	  if morning_shift_end < morning_shift_start
    	errors.add(:morning_shift_end, error_msg)
  	end

  	if night_shift_end < night_shift_start
    	errors.add(:night_shift_end, error_msg)
  	end
  end

	def set_defaults
		# s3 bucket path can be used for image here
		self.banner_image_path = "https://www.google.com/search?q=restaurant+dummy+image&client=firefox-b-ab&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjMxJHE7fvfAhVTVH0KHU1jCu4Q_AUIDigB&biw=1366&bih=585#imgrc=XgFjhKiC7k16SM:"
	end

end

