class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.page(params[:page]).per(10)
      render "index.json.jbuilder", status: :ok 
  end

  def create
    post = current_user.posts.create(post_params)
      redirect_to posts_path
  end

  def new
    @post = Post.new
      redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
      render "index.json.jbuilder", status: :ok 
    # respond_to do |format|
    #   format.json { render json: @post }
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user_id
      flash[:notice] = "Destroyed the post: #{post.title}"
      post.destroy
    else
      flash[:notice] = "Can't destroy this post."
    end
    redirect_to posts_path
  end
    
    private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
