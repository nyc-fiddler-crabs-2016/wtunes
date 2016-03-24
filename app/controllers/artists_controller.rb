class ArtistsController < ApplicationController
  before_action :check_user_logged_in?

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    @song = Song.new
  end

  def create

  @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "Artist added"
      # render partial: "topics/conversation_response", layout: false
      redirect_to @artist
    else
      render "albums/show"
    end
  end


  private
  def artist_params
    params.require(:artist).permit(:name, :album_id)
  end

end