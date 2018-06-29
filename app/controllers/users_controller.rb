class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    if logged_in?
      redirect_to @current_user
    end
    @user = User.new
  end

  def create
    if logged_in?
      redirect_to @current_user
    end
    @user = User.new(params[:user])

    if @user.save
      login @user
      redirect_to @user
    else
      render 'new'
    end
  end

end
