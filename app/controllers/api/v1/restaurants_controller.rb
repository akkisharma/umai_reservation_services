class Api::V1::RestaurantsController < ApplicationController


	def show
		filtered_json = []
		if params[:id].present?
			restaurant_id = params[:id].to_i
			reservations = Reservation.where(restaurant_id: restaurant_id)
			reservations.each do |reservation|
				filtered_json << { reservation_time: reservation.reservation_time.strftime("%d %B, %Y %H:%M %p"), guest_count: reservation.guest_count, guest_name: reservation.guest.name, table_name: reservation.table.name }
			end
		end

		json_response(filtered_json)
	end


end
