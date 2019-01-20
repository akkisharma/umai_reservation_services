class Api::V1::ReservationsController < ApplicationController

  def index
  	reservations = Reservation.all
  	json_response(reservations)
  end

  def create
		reservation = Reservation.create!(reservation_params)
		json_response(reservation, :created)
  end

  private

  def reservation_params
    # whitelist params
    params.permit(:guest_id, :restaurant_id, :table_id, :reservation_time, :guest_count)
  end

end