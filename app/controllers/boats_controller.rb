class BoatsController < ApplicationController
#before_action :set_task, only: [ :show, :edit, :update, :destroy ]
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
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:city, :description, :category, :number_of_people)
  end

end
