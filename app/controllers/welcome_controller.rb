class WelcomeController < ApplicationController
  def index
    if !session[:user_id]
      @user = "stranger"
    else
      @user = User.find(session[:user_id])
    end
  end
  def about_us
  end
end
