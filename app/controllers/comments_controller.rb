class CommentsController < ApplicationController
  def create
    p "hi"

    @user = User.find(session[:user_id])
    puts "USER:"
    puts @user.inspect

    @post = Post.find(params[:id])
    puts "POST"
    puts @post.inspect

    @comment = @post.comments.new(comment_params)
    @comment.save
    redirect_to post_path
  end

  private
  def comment_params
   params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
