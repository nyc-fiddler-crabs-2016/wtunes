class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    @artist.albums.build
  end

  def show
    @artist = Artist.find(params[:id])
    # @albums = @artist.albums
    #@album = Album.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "artist created successfully"
      redirect_to artists_path
    else
      render 'artists/new'
    end
  end

  private

    def artist_params
      params.require(:artist).permit(:name, albums_attributes: [:id, :title]).merge(user_id: current_user.id)
    end

end
