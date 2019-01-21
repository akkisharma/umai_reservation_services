module ReservationManagement

	def self.free_tables_after_one_hour_of_booking
		begin
			booked_tables = Table.where(is_free: false)

			booked_tables.each do |table|
				table.booked_end >= Time.now
				table.update_attributes(is_free: true, booked_at: nil, booked_end: nil)
			end
		rescue Exception => e
			Rails.logger.info "Exception: Error - #{e.class}: #{e.message}: #{e.backtrace}"
		end
	end

end