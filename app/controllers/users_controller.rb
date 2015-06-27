class UsersController < ApplicationController
	
	def show
		if params[:id] == "anonymus"
#			@user = User.find(params[:id])
			@thoughts = Thought.where('anonymus = ?', true)
		else
	    	@user = User.find(params[:id])
	    	@thoughts = @user.thoughts
	    	if current_user == @user
		    	@thoughts
		    else
			    @thoughts = @thoughts.where('anonymus = ?', false)
			end
		end
	end
	
	def favorite
		user = User.find(params[:id])
		@liked_thougts = user.favorite_thoughts
	end
end
