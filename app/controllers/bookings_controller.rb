class BookingsController < ApplicationController
  def new
    @doctor = User.find(params[:doctor_id])
    @bookings = Booking.where(doctor_id: params[:doctor_id])
  end

  def create
    Booking.create(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:doctor_id, :patient_id, :date)
  end
end
