class CommentsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    params[:comment][:user] = @current_user
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end