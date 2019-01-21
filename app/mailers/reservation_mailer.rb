class ReservationMailer < ApplicationMailer
	default from: 'sharma.akash1892@gmail.com'

  def reservation_email_for_guest
    @reservation = params[:reservation]
    @guest = @reservation.guest
    @restaurant = @reservation.restaurant
    @table = @reservation.table
    mail(to: @guest.email, subject: "#{@restaurant.name} reservation details")
  end

  def reservation_email_for_restaurant
    @reservation = params[:reservation]
    @guest = @reservation.guest
    @restaurant = @reservation.restaurant
    @table = @reservation.table
    mail(to: @restaurant.email, subject: "Reserved guest details")
  end

end
