class UsersController < ApplicationController
  before_action :move_to_index, only: :show

  def show
    @user = User.find(params[:id])
    @searches = @user.search
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.id == params[:id].to_i
  end

end
