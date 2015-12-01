class RegistrationsController < ApplicationController
  def new
  	@user = User.new
  	render :new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to posts_path
  	else
  		render :new
  	end
  end

  	private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :gamertag,
  									 :email, :password)
  	end
end
