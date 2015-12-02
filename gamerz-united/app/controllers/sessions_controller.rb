class SessionsController < ApplicationController
  def create
  	@user = User.find_by!(username: params[:username])
  	if @user.authenticate(params[:password])
  		render "create.json.jbuilder", status: :ok 
  	else
  		render json: { error: "Could not find user for #{params[:username]} or wrong password." },
        status: :unauthorized
  	end
  end

  def new
      redirect_to posts_path
    end
end
