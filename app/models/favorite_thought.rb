class FavoriteThought < ActiveRecord::Base
	
  	belongs_to :user
  	belongs_to :thought
  	
  	validates :user_id, presence: true
  	validates :thought_id, presence: true
	
end
