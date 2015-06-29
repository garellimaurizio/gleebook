class ThoughtsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]
#	before_action :create_slug(@thought), only: :show
#	before_action :check_user_ownership, only: [:destroy, :edit]

	def index
		@thoughts = Thought.all
		if params[:search]
			@thoughts = Thought.search(params[:search])
		end
	end
	
	def new
		@thought = Thought.new
	end
	
	def create
		@thought = Thought.new(params[:thought].permit(:title, :content, :anonymus))
		create_slug(@thought)
		@thought.like_counter = 0
		@thought.visit_counter = 0
		@thought.user = current_user
		@thought.save
		flash[:notice] = 'Thought succeffully posted'
		redirect_to @thought
	end
	
	def show
		if params[:slug]
			@thought = Thought.find_by slug: params[:slug]
		else			
			@thought = Thought.find(params[:id])
			@thought.increment!(:visit_counter, by = 1)
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
	
	def like
		@thought = Thought.find(params[:id])
		@thought.increment!(:like_counter, by = 1)
		redirect_to @thought
	end
	
	
		
	private
		def create_slug(thought)
			thought.slug = (thought.title.gsub ' ', '-').downcase
		end
		
	
	
	
end
