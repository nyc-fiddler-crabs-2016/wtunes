class SongsController < ApplicationController

  before_action :check_user_logged_in?

  def index
    @songs = Song.all
  end

  def show
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "song added"
      redirect_to @artist
    else
      render "artists/show"
    end
  end


  private
  def song_params
    params.require(:song).permit(:name, :album_id, :artist_id)
  end

end