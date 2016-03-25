class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    if @album.songs.count > 0
      @album.songs.build
    else
      3.times { @album.songs.build }
    end
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "album created successfully"
      redirect_to album_path
    else
      render "artist"
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Updated successfully"
    else
      render :edit
    end
  end

  private

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, songs_attributes: [:id, :name])
    end

end
