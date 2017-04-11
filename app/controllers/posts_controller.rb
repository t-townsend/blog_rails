class PostsController < ApplicationController

  def new
    @post = Post.new
  end

   def index
     @posts = Post.all
   end

   def show
     @post = Post.find(params[:id ])
     @comment = Comment.new
     @user = User.find(params[:id])
   end

   def edit
     @post = Post.find(params[:id])
   end

   def update
      post_params = params.require(:post).permit(:title, :body, :image)
      @post = Post.find params[:id]
      if @post.update post_params
        redirect_to post_path(@post)
      else
        render :edit
      end
    end

    def destroy
      post = Post.find params[:id]
      post.destroy
      redirect_to posts_path
    end

   def create
     post_params = params.require(:post).permit(:title, :user, :image, :body)
     @post = Post.create post_params
      if @post.save
         redirect_to post_path(@post)
         render text: "Question created successfully"
       else
       render :new
     end
   end
end
