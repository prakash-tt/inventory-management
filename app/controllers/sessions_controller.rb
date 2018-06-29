class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to @current_user
    end
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      flash[:errors] = 'Invalid login credentials'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

end
