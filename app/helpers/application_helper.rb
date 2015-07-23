module ApplicationHelper
	def administrator?
		!!session[:user]
	end
end
