class Thought < ActiveRecord::Base

	validates :title, presence: true
	validates :content, presence: true

	belongs_to :user
	
	has_many :liked_thoughts, dependent: :destroy
	has_many :favorite_thoughts, dependent: :destroy
	
	def self.search(search)
		  if search
		    where('title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%")
		  else
		    scoped
		  end
	end
	
	def self.get_previous_thought(current_thought)
		Thought.where("thoughts.id < ? ", current_thought.id).order('created_at asc').last
	end
	
	def self.get_next_thought(current_thought, current_user)
		Thought.where("thoughts.id > ? ", current_thought.id).order('created_at asc').first
	end

	
	

end
