class WelcomeController < ApplicationController

  def index
    @posts = Post.all
    @last = Post.last
    @list = Post.last(5)
  end
end
