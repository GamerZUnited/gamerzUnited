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
end
