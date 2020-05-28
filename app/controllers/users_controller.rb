class UsersController < ApplicationController
  def show
    @user = current_user
    @boats = @user.boats
  end
end
