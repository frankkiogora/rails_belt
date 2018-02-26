class PlaylistsController < ApplicationController
  before_action :loggedIn, except: [:update]
  def index 

  end

  def new 

  end

  def create

  end

  def show 

  end
  def edit 

  end
  def update 
    @user = User.find(session[:user_id])
    @song = Song.find(params[:id])
    if Playlist.find_by(user: @user, song: @song)
        puts 'update existing playlist add_count'
        @playlist = Playlist.find_by(user: @user, song: @song)
        @playlist.add_count += 1
    else
        puts 'create new playlist add_count'
        @playlist = Playlist.new(add_count: 1,user: @user, song: @song)
    end
    if @playlist.save
      redirect_to "/songs"
    else
      flash[:add_error] = @playlist.errors
      redirect_to "/songs"
    end
  end

  def destroy

  end
end
