class Reservation < ApplicationRecord

	# Associations
  belongs_to :guest
  belongs_to :table
  belongs_to :restaurant

	# Validations
  validates_presence_of :guest, :table, :restaurant, :reservation_time, :guest_count, presence: true
  validate :reservation_time_in_shift_range
  validate :check_if_table_available

  # Callbacks
  before_save :set_reservation_end_time

  private

  def reservation_time_in_shift_range

  	begin
	  	restaurant = self.restaurant
	  	table = self.table


	  	parsed_reservation_time = Time.parse(reservation_time.strftime("%d %b, %Y %I:%M%p"))
	  	parsed_restaurant_shift_time = restaurant.convert_restaurant_shift_time_in_todays_format

	  	unless parsed_reservation_time >= parsed_restaurant_shift_time[:morning_start_shift] &&
	  		     parsed_reservation_time <= parsed_restaurant_shift_time[:morning_end_shift] ||
	  		     parsed_reservation_time >= parsed_restaurant_shift_time[:night_start_shift] &&
	  		     parsed_reservation_time <= parsed_restaurant_shift_time[:night_end_shift]
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

  def check_if_table_available
  	begin

  		table = self.table
  		restaurant = self.restaurant
  		restaurant_reservations_of_date = Reservation.where(restaurant_id: restaurant.id, table_id: table.id, reservation_time: self.reservation_time.beginning_of_day..self.reservation_time.end_of_day)

			number_of_slots_alloted_for_table = restaurant_reservations_of_date.map { |res| self.reservation_time >= res.reservation_time && self.reservation_time < res.reservation_end }.count(true)

			if number_of_slots_alloted_for_table > 0
  			errors.add(:reservation_time, "is already alloted to the table")
  		end


  	rescue Exception => e
  		return false
  	end
  end

  def set_reservation_end_time
  	self.reservation_end = self.reservation_time + 1.hour
  end

end
