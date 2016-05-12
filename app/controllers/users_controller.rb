class UsersController < ApplicationController
  before_action :set_user, :authenticate_user!

  def show

  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def remove_album
byebug
    album=Album.find_by(id: params[:id])
    @user.albums.delete(Album.find_by(id: params[:id]))
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end
end
