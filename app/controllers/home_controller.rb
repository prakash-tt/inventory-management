class HomeController < ApplicationController

  def new
    @posts = Post.order('updated_at')
    render 'new'
  end
end
