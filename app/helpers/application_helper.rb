module ApplicationHelper
	def administrator?
		!!session[:user]
	end

	def title(page_title)
  		content_for :title, page_title.to_s
	end
end
