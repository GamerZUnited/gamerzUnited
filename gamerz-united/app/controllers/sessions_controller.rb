class SessionsController < ApplicationController
  def create
  	user = User.find_by!(gamertag: params[:gamertag])
  	if user.authenticate(params [password])
  		session[:user_id] = user.id 
  		redirect_to posts_path 
  	else
  		redirect_to login_index_path
  	end
  end

  def new
  	render :new
  end

  def destroy
  	session[:user_id] = nil
    redirect_to login_index_path
  end
end
