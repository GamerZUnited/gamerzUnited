class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def create
  end

  def new
  end

  def show
  end

  def destroy
  end
end
