class BookingsController < ApplicationController
  before_action :set_boat, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
