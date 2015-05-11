class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def new
    if current_user
      @post = Post.new
    else
      flash[:notice]= "Please sign in order to post"
      redirect_to login_path
    end
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = "New post created"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was update"
      redirect_to posts_path
    else 
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post was deleted"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user: current_user)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  

end
