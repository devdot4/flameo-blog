class UsersController < ApplicationController
  def index
    @message = "FLAMEO!"
    @users = User.all
  end
  def new
    @message = "NEW FLAMEO!"
    @user = User.new
  end
  def create
    # This action receives data from #new and creates a new User.
    # .create returns the obj that was just created
    @new_user = User.new(user_params)
    # check if .create did its job
    @new_user.save
    if @new_user.save
      puts "SUCCESS"
      session[:user_id] = @new_user.id
      redirect_to url_for(:controller => :users, :action => :index)
    else
      puts "ERROR"
      redirect_to url_for(:controller => :users, :action => :new)
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    # Must have 'shortcuts' in routes for this to work
    @message = "This is the form to edit an existing user."
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
    User.delete(params[:id])
    session.destroy
    redirect_to url_for(:controller => :users, :action => :index)
 end

 # form to login
  def login_form
    # if already logged in:
    if session[:user_id]
      @message = "You're already logged in!"
    else
      @message = "This is the login page."
    end
  end

  # check db & create a session
  def create_login
    @message = "message"

    @user = User.where( username: params[:username], password: params[:password] ).first

    if @user
      session[:user_id] = @user.id
      redirect_to url_for(:controller => :users, :action => :index)
    else
      redirect_to url_for(:controller => :users, :action => :login_form)
    end
  end

  #
  def logout
    session.destroy
    redirect_to url_for(:controller => :welcome, :action => :index)
  end

 private
 def user_params
   params.require(:user).permit(:username, :password, :email)
 end
end
