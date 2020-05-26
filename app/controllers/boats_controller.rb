class BoatsController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end
end
