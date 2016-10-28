class UsersController < ApplicationController
  def index
    @message = "FLAMEO!"
    @users = User.all
  end
  def new
    @message = "NEW FLAMEO!"
  end
  def create
    # This action receives data from #new and creates a new User.

    # .create returns the obj that was just created
    @new_user = User.create(
      username: params[:user][:username],
      password: params[:user][:password],
      email: params[:user][:email]
    )
    # check if .create did its job
    if @new_user
      puts "SUCCESS"
      redirect_to url_for(:controller => :users, :action => :index)
    else
      puts "ERROR"
      redirect_to url_for(:controller => :users, :action => :new)
    end
  end
  def show
    @user = User.find(params[:id])
    @message = "This route shows all info for an individual user named: #{@user.username} #{@user.password}."
  end
  def edit
    # Must have 'shortcuts' in routes for this to work
    @message = "This is the form to edit an existing user."
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update({
      username: params[:user][:username],
      password: params[:user][:password],
      email: params[:user][:email]
    })

    if (@user)
      redirect_to url_for(:controller => :users, :action => :index)
    else
      redirect_to url_for(:controller => :users, :action => :edit)
    end
  end
  def destroy
   User.delete(params[:id])
   redirect_to url_for(:controller => :users, :action => :index)
 end
end
