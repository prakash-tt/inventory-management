class UsersController < ApplicationController

  before_filter :authenticate_user!
  def show
    render 'show'
  end
end
