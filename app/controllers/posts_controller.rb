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
    if @post.save
      redirect_to profile_posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    raise ActionController::RoutingError.new('Not Found') if @post.blank?
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to profile_posts_path
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

end
