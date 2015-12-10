class Game < ActiveRecord::Base
	has_many :users, :through => :user_games
	has_many :user_games

	validates_presence_of :title, :console, :genre
end
