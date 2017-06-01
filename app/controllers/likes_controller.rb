class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.likes.new
    post = Post.find params[:post_id]
    like.post = post
    if cannot? :like, post
       return redirect_to(post_path(post), alert: 'Liking your own post is disgusting')
    end
    if like.save
      redirect_to root_path, notice: "Liked!"
    else
      redirect_to root_path, alert: "Cannot Like!"
    end
  end

  def destroy
    like = current_user.likes.find params[:id]
    if cannot? :like, like.post
       return redirect_to(post_path(post),alert: 'Unliking your own post is preposterous')
    end
    like.destroy
    redirect_to root_path, notice: "Unliked"
  end

  def index
    user = User.find(params[:user_id])
    @posts = user.liked_posts
    render 'posts/index'
  end




end
