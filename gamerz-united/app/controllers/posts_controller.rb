class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
      render "index.json.jbuilder", status: :ok 
  end

  def create
    post = current_user.posts.create(title: params[:title],
                     content: params[:content])
      render "index.json.jbuilder", status: :ok
  end

  def show
    @post = Post.find(params[:id])
      render "show.json.jbuilder", status: :ok 
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
    render "index.json.jbuilder", status: :ok
  end
    
    # private
    # def post_params
    #   params(:post).permit(:title, :content)
    # end
end
