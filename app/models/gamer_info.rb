class GamerInfo < ActiveRecord::Base
	belongs_to :user
	## has_one :gamer_info should be on User model probably

	def sync_api(gamertag)
		api = XboxApi.new
		results = api.get_gamer_info(gamertag)
		# self.update(foo: data["stuff"]["foo"],
		#             bar: data["other_stuff"]["bar"] ) # etc
	end
end


### In the controller
## if we do have the gamer info, skip to render
## if there isn't a GamerInfo for this user
## current_user.gamer_info.create
## current_user.gamer_info.sync_api(current_user.gamertag)

## render current_user.gamer_info
