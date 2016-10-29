class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @new_user = User.new(user_params)
    @new_user.save
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect_to url_for(:controller => :users, :action => :index)
    else
      redirect_to url_for(:controller => :users, :action => :new)
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if (@user)
      redirect_to url_for(:controller => :users, :action => :index)
    else
      redirect_to url_for(:controller => :users, :action => :edit)
    end
  end
  def destroy
    User.delete(user_params)
    session.destroy
    redirect_to url_for(:controller => :users, :action => :index)
 end

  def signin
  end

  # check db & create a session
  def create_signin

    @user = User.where( username: params[:username], password: params[:password] ).first

    if @user
      session[:user_id] = @user.id
      redirect_to url_for(:controller => :welcome, :action => :index)
    else
      redirect_to url_for(:controller => :users, :action => :signin)
    end
  end

  def signout
    session.destroy
    redirect_to url_for(:controller => :users, :action => :signin)
  end
 private
 def user_params
   params.require(:user).permit(:username, :password, :email)
 end
end
