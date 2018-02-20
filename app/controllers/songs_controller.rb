class SongsController < ApplicationController


  def create
    playlist = Playlist.find(params[:playlist_id])
    playlist.songs.build(song_params)
    playlist.save

    redirect_to playlist, notice: "la cancion se ha creado con exito!"
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to playlist_path, notice: "la cancion se ha eliminado con exito!"

  end



  private

  def song_params
    params.require(:song).permit(:artist, :name)


  end

end
