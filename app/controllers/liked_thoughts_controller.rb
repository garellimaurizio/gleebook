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
		else
			@thought.decrement!(:like_counter, by = 1)
			@liked_thought.destroy
		end
#		redirect_to @thought
		respond_to do |format|
			format.html { redirect_to @thought }
			format.js
		end
		
	end
		
	def destroy
#		@thought = Thought.find(params[:thought_id])
#		@user = current_user
#		@liked_thought = LikedThought.new(user_id: @user.id, thought_id: @thought.id)
#		raise params.inspect

#		@liked_thought = LikedThought.find(params[:id])
#		@thought = @liked_thought.thought



#		@thought = Thought.find(params[:id])
		@user = current_user
#		@liked_thought = LikedThought.where('thought_id = ? AND user_id = ?', @thought.id, @user.id)

		@liked_thought = LikedThought.find(params[:id])		
		@thought = @liked_thought.thought
		
		@thought.decrement!(:like_counter, by = 1)
		@liked_thought.destroy
		
		respond_to do |format|
			format.html { redirect_to @thought }
			format.js
		end
	end
end
