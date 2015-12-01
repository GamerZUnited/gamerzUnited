class SessionsController < ApplicationController
  def create
  	user = User.find_by!(gamertag: params[:gamertag])
  	if user.authenticate(params [password])
  		session[:user_id] = user.id 
  		  render "create.json.jbuilder", status: :ok 
  	else
  		  render json: { error: "Could not find user for #{params[:username]} or wrong password." },
          status: :unauthorized
  	end
  end

  def new
  	render "new.json.jbuilder", status: :ok
  end

  def destroy
  	session[:user_id] = nil
    redirect_to login_index_path
  end
end
