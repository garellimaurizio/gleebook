class LikedThoughtsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		puts params.inspect

		@thought = Thought.find(params[:thought_id])
		@user = current_user
		@liked_thought = LikedThought.new(user_id: @user.id, thought_id: @thought.id)
		if (@liked_thought.valid?)
			@liked_thought.save
			@thought.increment!(:like_counter, by = 1)
#			@thought.increment!(:visit_counter, by = 1)
		else
			@thought.decrement!(:like_counter, by = 1)
			@liked_thought.destroy
		end

		respond_to do |format|
#			format.html { redirect_to @thought }
			format.js
		end
	end
		
	def destroy
		@user = current_user
		@liked_thought = LikedThought.find(params[:id])		
		@thought = @liked_thought.thought
		
		@thought.decrement!(:like_counter, by = 1)
		@liked_thought.destroy
		
		respond_to do |format|
#			format.html { redirect_to @thought }
			format.js
		end
	end
end
