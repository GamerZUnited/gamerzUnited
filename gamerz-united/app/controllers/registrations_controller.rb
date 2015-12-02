class RegistrationsController < ApplicationController
  def new
  	@user = User.new
  	render "new.json.jbuilder", status: :ok
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		render "create.json.jbuilder", status: :created
  	else
  		render json: { errors: @user.errors.full_messages },
        	status: :unprocessable_entity
  	end
  end

  	private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :username,
  									 :email, :password)
  	end
end
