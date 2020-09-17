class GenresController < ApplicationController

  get "/genres" do
    @genres = Genre.all
    erb :'genres/index'
  end

#   get "/genres/:id" do
#     @genre = Genre.find(params[:id])
#     @songsgenre = SongGenre.where(genre_id: @genre.id)
#     @songs = 
#     binding.pry
#     erb :'genres/show'
#   end

  get '/genres/:slug' do 
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end


  

end
