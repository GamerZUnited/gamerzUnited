class RegistrationsController < ApplicationController
  def new
  	@user = User.new
  	render "new.json.jbuilder", status: :ok
  end

  def create
  	@user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     first_name: params[:first_name],
                     last_name: params[:last_name],
                     gamertag: params[:gamertag]
                     )
  	if @user.save
  		render "create.json.jbuilder", status: :created
  	else
  		render json: { errors: @user.errors.full_messages },
        	status: :unprocessable_entity
  	end
  end

  	# private
  	# def user_params
  	# 	params(:user).permit(:first_name, :last_name, :username,
  	# 								 :email, :password)
  	# end
end
