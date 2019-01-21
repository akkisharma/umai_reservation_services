class Reservation < ApplicationRecord

	# Associations
  belongs_to :guest
  belongs_to :table
  belongs_to :restaurant

	# Validations
  validates_presence_of :guest, :table, :restaurant, :reservation_time, :guest_count, presence: true
  validate :reservation_time_in_shift_range


  private

  def reservation_time_in_shift_range

  	begin
	  	restaurant = self.restaurant
	  	table = self.table

	  	parsed_reservation_time = Time.parse(reservation_time.strftime("%d %b, %Y %I:%M%p"))
	  	morning_start_shift_in_today_format = Time.parse("#{Time.now.strftime('%d %b, %Y')} #{restaurant.morning_shift_start.strftime('%I:%M%p')}")
	  	morning_end_shift_in_today_format = Time.parse("#{Time.now.strftime('%d %b, %Y')} #{restaurant.morning_shift_end.strftime('%I:%M%p')}")
	  	night_start_shift_in_today_format = Time.parse("#{Time.now.strftime('%d %b, %Y')} #{restaurant.night_shift_start.strftime('%I:%M%p')}")
	  	night_end_shift_in_today_format = Time.parse("#{Time.now.strftime('%d %b, %Y')} #{restaurant.night_shift_end.strftime('%I:%M%p')}")

	  	unless parsed_reservation_time >= morning_start_shift_in_today_format && parsed_reservation_time <= morning_end_shift_in_today_format || parsed_reservation_time >= night_start_shift_in_today_format && parsed_reservation_time <= night_end_shift_in_today_format
	  		errors.add(:reservation_time, "should be in restaurant shift timings")
	  	end

	  	unless guest_count >= table.min_guest && guest_count <= table.max_guest
	  		errors.add(:guest_count, "should be in MIN(#{table.min_guest}) and MAX(#{table.max_guest}) number of guest for table")
	  	end

	  	if table.is_free == false
	  		errors.add(:reservation_time, "given is not available for Table")
	  	end
	  rescue Exception => e
	  	return false
	  end

  end

end
