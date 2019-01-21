require 'rufus-scheduler'
require 'reservation_management'

scheduler = Rufus::Scheduler::singleton

# scheduler.every '5m' do
# 	Rails.logger.info "---------- START: Free up the one hour booked tables--------"

# 	ReservationManagement.free_tables_after_one_hour_of_booking

# 	Rails.logger.info "---------- END: Free up the one hour booked tables--------"
# end