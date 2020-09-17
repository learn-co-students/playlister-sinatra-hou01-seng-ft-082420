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
    @artist = Artist.where("#{params[:name]} == name")
    @song = Song.create(params)
  end

  patch "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    redirect "/songs/#{@song.slug}"
  end

end
