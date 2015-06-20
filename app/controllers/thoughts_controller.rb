class ThoughtsController < ApplicationController

#	before_action :create_slug(@thought), only: :show

	def index
		@thoughts = Thought.all
	end
	
	def new
		@thought = Thought.new
	end
	
	def create
		@thought = Thought.new(params[:thought].permit(:title, :content))
		create_slug(@thought)
		@thought.save
		flash[:notice] = 'Thought succeffully posted'
		redirect_to @thought
	end
	
	def show
		if params[:slug]
			@thought = Thought.find_by slug: params[:slug]
		else			
			@thought = Thought.find(params[:id])
			create_slug(@thought)
		end
	end
	
	def edit
		@thought = Thought.find(params[:id])
	end
	
	def update
		@thought = Thought.find(params[:id])
		@thought.update(params[:thought].permit(:title, :content))
		redirect_to @thought
	end
		
	
	def destroy
		@thought = Thought.find(params[:id])
		@thought.destroy
		redirect_to @thought
	end
	
	private
		def create_slug(thought)
			thought.slug = (thought.title.gsub ' ', '-').downcase
		end
	
end
