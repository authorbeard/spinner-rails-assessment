class AlbumsController < ApplicationController
  # before_action :store_location
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_album, except: [:index, :new, :create]

  def index
    @albums=Album.all
  end

  def new
  end

  def create
    @album=Album.new(album_params)
    if @album.save!
      redirect_to album_path(@album)
    else
      redirect_to :back, :alert=>"Check that album info again."
    end
  end

  def show
  end

  def edit
byebug
  end

  def spin
byebug
    current_user.spin_it(@album)
    redirect_to user_path(current_user)
  end

  def update
    @album.update(album_params)
    redirect_to album_path(@album)
  end


  def destroy
    @album.destroy_all
    redirect_to albums_path, :notice=>"Album destroyed"
  end

  private

  def set_album
    @album=Album.find_by(id: params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :catalog_no, :group, :rel_date, :rel_id, :acquired, :search_q, :alb_url, :artist_id, songs: [])
  end

end
