module ApplicationHelper

	def full_title(page_title = "")
		default_title = "Gleebook"
		if page_title.empty?
			default_title
		else
			"#{page_title} | #{default_title}"
		end
	end
	
	def bootstrap_class_for flash_type
		case flash_type
			when :success
				"alert-success"	# Green
			when :error
				"alert-error"	# Red
			when :alert
				"alert-block"	# Yellow
			when :notice
				"alert-info"	# Blue
			else
				flash_type.to_s
		end
	end
  
  	def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

end
