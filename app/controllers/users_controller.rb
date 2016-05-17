class UsersController < ApplicationController
  before_action :set_user, :authenticate_user!

  def show
    respond_to do |format|
      format.html { render :show, :locals=>{user_albums: current_user.albums}}
      format.json { render json: current_user }
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def collection
# byebug 
  end

  def remove_album
    album=Album.find_by(id: params[:id])
    @user.albums.delete(Album.find_by(id: params[:id]))
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:id, :name, :email)
  end
end
