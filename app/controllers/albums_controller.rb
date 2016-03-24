class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
    @artists = @album.artists
    @artist = Artist.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "album created successfully"
      redirect_to albums_path
    else
      render 'albums/new'
    end
  end

  private

    def album_params
      params.require(:album).permit(:title).merge(user_id: current_user.id)
    end

end
