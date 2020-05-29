class BookingsController < ApplicationController

  before_action :set_boat, only: [:create, :new]

  def index
    @user = current_user
    @bookings_as_renter = @user.bookings
    @bookings_as_owner = Booking.joins(:boat).where(boats: { user_id: current_user.id })
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
      redirect_to bookings_path
    else
      render :new
    end
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.confirmed = "accepted"
    @booking.save
    redirect_to bookings_path
  end

  def declined
    @booking = Booking.find(params[:id])
    @booking.confirmed = "declined"
    @booking.save
    redirect_to bookings_path
  end

  private

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :boat_id)
  end
end
