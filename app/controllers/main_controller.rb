class MainController < ApplicationController
  skip_before_action :require_login, only: [:index]
  before_action :loggedIn, except: [:destroy]

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

  end
  def destroy
    session[:user_id] = nil
    redirect_to "/main"
  end
end
