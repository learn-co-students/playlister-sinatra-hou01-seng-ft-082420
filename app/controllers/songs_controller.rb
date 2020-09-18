class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    @genres = Genre.all
      erb :'songs/new'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    erb :'songs/show'
  end

  post "/songs" do
    @artist = Artist.where(name: params[:artist])
    if @artist.length == 0
      @artist = Artist.create(name: params[:artist])
      @song = Song.create(name: params[:song_name], artist_id: @artist.id)
    else
      @song = Song.create(name: params[:song_name], artist_id: @artist.id) 
    end
    params[:genres].each {|genre| SongGenre.create(song_id: @song.id, genre_id: genre)}
    redirect "/songs/#{@song.slug}"
  end

  patch "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    redirect "/songs/#{@song.slug}"
  end

end
