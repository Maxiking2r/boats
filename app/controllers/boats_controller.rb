class BoatsController < ApplicationController
#before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:city, :description, :category, :number_of_people, photos: [])
  end

end
