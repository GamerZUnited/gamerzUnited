class GamerInfoController < ApplicationController
  def create
  	api = XboxApi.new
	results = api.get_gamer_info(current_user.gamertag)
	@gamer_info = current_user.gamer_info.new(gamerscore: results["gamerscore"], avatarBodyImagePath: results["avatarBodyImagePath"],
											  location: results["location"])
  		if @gamer_info.save
  		render "show.json.builder", status: :ok
  		else
  			render json: { errors: @gamer_info.errors.full_messages }
  		end
  	end

  def show
  	@gamer_info = Gamer_info.find(params[:user_id])
  		render "show.json.builder", status: :ok 
  end
end
