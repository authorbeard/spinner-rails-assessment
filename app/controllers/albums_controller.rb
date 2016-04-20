class AlbumsController < ApplicationController
  # before_action :store_location
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_album, except: [:index, :new, :create]

  def index
    @albums=Album.all
  end

  def show
# byebug
  end

  def new
  end

  def import
  end

  def add
    current_user.albums << @album
    redirect_to :back, :notice=>"Awesome choice! <a href='#{album_path(@album)}'>Spin it now</a>"
  end

  def create
    @album=Album.new(album_params)
    if @album.save!
      redirect_to album_path(@album)
    else
      redirect_to :back, :alert=>"Check that album info again."
    end
  end

  def edit
    redirect_to :back, :alert=>"You gotta be logged in & have that album to edit it" unless current_user.albums.include?(@album)
  end

  def update
# byebug
    @album.update(album_params)
    redirect_to album_path(@album)
  end

  def spin
# byebug
    current_user.spin_it(@album)
    redirect_to album_path(@album)
  end


  def destroy
# byebug
    current_user.user_albums.find_by(album_id: @album.id).delete
    redirect_to albums_path, :notice=>"Okay, you ain't got that one anymore."
  end

  private

  def set_album
    @album=Album.find_by(id: params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :catalog_no, :group, :rel_date, :rel_id, :acquired, :search_q, :alb_url, :artist_id, :artist_attributes=>[:name], :songs_attributes=>[:title, :song_ids=>[]])
  end

end
