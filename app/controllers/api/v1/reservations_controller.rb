class Api::V1::ReservationsController < ApplicationController

  def index
  	reservations = Reservation.all
  	json_response(reservations)
  end

  def create
		@reservation = Reservation.create!(reservation_params)
		if @reservation.persisted?
			ReservationMailer.with(reservation: @reservation).reservation_email_for_guest.deliver_now
			ReservationMailer.with(reservation: @reservation).reservation_email_for_restaurant.deliver_now
			update_table_details(@reservation)
		end
		json_response(@reservation, :created)
  end

  private

  def update_table_details reservation
  	table = reservation.table
  	# we are reserving table for one hour
  	table.update_attributes(is_free: false, booked_at: reservation.reservation_time, booked_end: reservation.reservation_time + 1.hour)
  end

  def reservation_params
    # whitelist params
    params.permit(:guest_id, :restaurant_id, :table_id, :reservation_time, :guest_count)
  end

end