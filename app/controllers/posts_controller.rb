class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(session[:user_id])
  end
  def new
    @post = Post.new
  end
  def create
    @new_post = Post.new(post_params)
    if @new_post.save
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :new)
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to url_for(:controller => :posts, :action => :index)
  end

  private
  def post_params
   params.require(:post).permit(:title, :content, :user_id)
  end
end
