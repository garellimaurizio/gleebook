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
	
	

end
