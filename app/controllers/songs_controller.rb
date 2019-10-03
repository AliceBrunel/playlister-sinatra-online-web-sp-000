
require 'rack-flash'
class SongsController < ApplicationController

  get '/songs' do
  	@songs = Song.all
  	erb :'song/songs'
  end

  get '/songs/new' do
  	erb :'song/form'
  end

  get '/songs/:slug' do
	  @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    redirect("/songs/#{@song.slug}")
  end



end
