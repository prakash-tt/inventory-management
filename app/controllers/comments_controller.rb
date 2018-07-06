class CommentsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    params[:comment][:user] = current_user
    @comment = @post.comments.create(params[:comment])
    respond_to do |format|
      format.js {render partial: "post_create"}
    end
  end

  def destroy
    Comment.destroy(params[:id])
    respond_to do |format|
      # format.html { redirect_to post_path(@post) }
      format.js   { render partial: "post_delete" }
    end
  end

end
