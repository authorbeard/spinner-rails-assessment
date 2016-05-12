class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @songs=Song.all
  end

  def search
    
    @song = Song.find_by(title: params[:title])
  byebug
    redirect_to song_path(@song)
  end

  def import

  end

  def show
    @song=Song.find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
