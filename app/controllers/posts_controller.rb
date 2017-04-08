class PostsController < ApplicationController

  def new
    @post = Post.new
  end

   def index
     @post = Post.new
   end

   def show
     @post = Post.find(params[:id ])
     @comment = Comment.new
     @user = User.find(params[:id])
   end

   def create
     post_params = params.require(:post).permit(:title, :user, :image, :body)
     @post = Post.create post_params
       if @post.save
         redirect_to post_path(@post)
       else
       render :new
      end
   end
end
