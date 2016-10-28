class PostsController < ApplicationController
  def index
    @message = "FLAMEO!"
    @posts = Post.all
  end
  def new
    @message = "NEW FLAMEO!"
  end
  def create
    # This action receives data from #new and creates a new Post.

    # .create returns the obj that was just created
    @new_post = Post.create(
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id]
    )
    # check if .create did its job
    if @new_post
      puts "SUCCESS"
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      puts "ERROR"
      redirect_to url_for(:controller => :posts, :action => :new)
    end
  end
  def show
    @post = Post.find(params[:id])
    @message = "This route shows all info for an individual post named: #{@post.title} #{@post.content}."
  end
  def edit
    # Must have 'shortcuts' in routes for this to work
    @message = "This is the form to edit an existing post."
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update({
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id]
    })

    if (@post)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
  end
  def destroy
   Post.delete(params[:id])
   redirect_to url_for(:controller => :posts, :action => :index)
 end
end
