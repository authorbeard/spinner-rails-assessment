class ArtistsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_artist, except: [:index, :new, :create]

  def index
    @artists=Artist.order(:name)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
byebug
  end

  def update
  end

  def destroy
  end

  private 
  def set_artist
    @artist=Artist.find_by(id: params[:id])
  end

end
