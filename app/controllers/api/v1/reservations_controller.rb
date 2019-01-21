class Api::V1::ReservationsController < ApplicationController

  def index
  	reservations = Reservation.all
  	json_response(reservations)
  end

  def create
		reservation = Reservation.create!(reservation_params)
		if reservation.persisted?
			ReservationMailer.with(reservation: reservation).reservation_email_for_guest.deliver_now
			ReservationMailer.with(reservation: reservation).reservation_email_for_restaurant.deliver_now
		end
		json_response(reservation, :created)
  end

  def update
  	if params[:id].present?
  		reservation = Reservation.find(params[:id].to_i) rescue nil

  		if reservation.present?
  			reservation.reservation_time = params[:reservation_time]
  			reservation.guest_count = params[:guest_count].to_i

  			reservation.save!
  			if reservation.guest_count_previously_changed? || reservation.reservation_time_previously_changed?
					ReservationMailer.with(reservation: reservation).updated_reservation_email_for_guest.deliver_now
  			end
  		end
			status = reservation.errors.present? ? :unprocessable_entity : :ok
			json_response(reservation, status)
  	end

  end

  private

  def reservation_params
    # whitelist params
    params.permit(:guest_id, :restaurant_id, :table_id, :reservation_time, :reservation_end, :guest_count)
  end

end