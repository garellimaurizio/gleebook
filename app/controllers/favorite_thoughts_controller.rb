class FavoriteThoughtsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		user = current_user
		@favorite_thought = user.favorite_thoughts
	end

	def create
		@thought = Thought.find(params[:thought_id])
		@user = current_user
		
		@favorite_thought = FavoriteThought.new(user_id: @user.id, thought_id: @thought.id)
		if (@favorite_thought.valid?)
			@favorite_thought.save
		else
			@favorite_thought.destroy
		end

		respond_to do |format|
#			format.html { redirect_to @thought }
			format.js
		end
	end
		
	def destroy
		@user = current_user
		@favorite_thought = FavoriteThought.find(params[:id])		
		@thought = @favorite_thought.thought
		
		@favorite_thought.destroy
		
		respond_to do |format|
#			format.html { redirect_to @thought }
			format.js
		end
	end

end
