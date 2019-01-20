class Api::V1::RestaurantsController < ApplicationController

	def create
	end


	def show
		if params[:id].present?
			restaurant_id = params[:id].to_i
			reservations = Reservation.find_by(restaurant_id: restaurant_id) rescue nil
		end

		json_response(reservations)
	end


end
