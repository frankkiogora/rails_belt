class SongsController < ApplicationController
    before_action :loggedIn, only: [:new, :edit]

    def index
        @songs = Song.all.order(created_at: :desc)
    end

    def new

    end

    def create
        @song = Song.new(song_params)
        @song.user = User.find(session[:user_id])
        if @song.save
          redirect_to "/songs"
        else
          flash[:add_song] = @song.errors
          redirect_to "/songs"
        end
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private
    def song_params
        params.require(:song).permit(:artist,:title)
    end

    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end
end
