class BookingsController < ApplicationController
  before_action :set_boat, only: [:create]

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = @boat
    if @booking.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :boat_id)
  end
end
