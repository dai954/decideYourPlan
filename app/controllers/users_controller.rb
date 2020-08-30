class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @searches = @user.search
  end

end
