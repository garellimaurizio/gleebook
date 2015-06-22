module ThoughtsHelper
	def like_button_link(thought)
		btnClass = "btn btn-default btn-xs heart-btn"
		thought.like_counter == 0 ? btnClass : btnClass + " heart-btn-liked"
	end
end
