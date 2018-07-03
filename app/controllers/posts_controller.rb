class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  load_and_authorize_resource

  def user_posts
    @user_posts = @current_user.posts
    render 'user_posts'
  end

  def new
    @post = Post.new
    render 'new'
  end

  def create
    @post = Post.new(title: params[:post][:title], description: params[:post][:description], user: current_user)
    respond_to do |format|
      if @post.save
        format.js {render partial: "post_create"}
      else
        # format.html { render :action => "new" }
        format.js {render :action => "new"}
      end
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    raise ActionController::RoutingError.new('Not Found') if @post.blank?
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    respond_to do |format|
      # format.html { redirect_to profile_posts_path }
      format.js   { render partial: "post_delete" }
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.js {render partial: "post_create"}
      else
        # format.html {render :action => "edit"}
        format.js {render :action => "new"}
      end
    end
  end

end
