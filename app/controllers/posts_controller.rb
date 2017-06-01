class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end

   def index
     @posts = Post.all
     @template = Post.last(params[:image])
   end

   def show
     @post = Post.find(params[:id ])
     @comment = Comment.new
     @user = @post.user
     @like = @post.like_for(current_user)
   end

   def edit
     redirect_to root_path, alert: "access denied" unless can? :edit, @post
     @post = Post.find(params[:id])
   end

   def update
      post_params = params.require(:post).permit(:title, :body, :image)
      redirect_to root_path, alert: "access denied" unless can? :update, @post
      @post = Post.find params[:id]
      if @post.update post_params
        redirect_to post_path(@post)
      else
        render :edit
      end
    end

    def destroy
      redirect_to root_path, alert: "access defined" unless can? :destroy, @post
      post = Post.find params[:id]
      post.destroy
      redirect_to posts_path
    end

   def create
    #  @post = Post.create post_params
    #  @post.user = current_user

      @post = current_user.posts.create(post_params)
      if @post.save
        redirect_to post_path(@post)
      else
        render :new
      end
   end

   private

    def post_params
      params.require(:post).permit(:title, :image, :body)
    end
end
