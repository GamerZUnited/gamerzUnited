class XboxApi

	include HTTParty
	base_uri "http://xboxapi.com"

	def initialize
		@key = {
			"X-AUTH" => ENV["XBOXAPI_API_KEY"],
			"Content-Type" => "application/json"
		}
		# TODO Put XboxAPI key in .env file and put file in .gitingnore
	end

	# def get_gamertag(xuid)
	# 	XboxApi.get("/v2/gamertag/:xiud", headers: @key)
	# end

	def get_xuid(gamertag)
		XboxApi.get("/v2/xuid/#{gamertag}", headers: @key)
	end

	def get_gamercard(xuid)
		XboxApi.get("/v2/#{xuid}/gamercard", headers: @key)
	end

	def get_gamer_info(gamertag)
		data = get_xuid(gamertag)
		results = get_gamercard(data)

	# 	get_gamercard(data["gamertag"]["location"]
	# 					  ["gamerscore"]["avatarBodyImagePath"])
	end
end

	## TODO End point for game stats api

	# def get_game_stats
	# 	response = XboxApi.get("v2/xuid/game-stats/:titleId", headers: @key)
	# end