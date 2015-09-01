module StaffHelper
	def contact_for(staff_member, contact_type)
		case contact_type
		when 'phone'
			"<a href='#' data-toggle='tooltip' data-placement='top' title=#{staff_member.phone}><i class='fa fa-phone'></i></a>".html_safe unless staff_member.phone.empty?
		when 'email'
			"<a href='mailto:#{staff_member.mail}'><i class='fa fa-envelope-o'></i></a>".html_safe unless staff_member.mail.empty?
		when 'facebook'
			"<a href='#{staff_member.facebook}'><i class='fa fa-facebook'></i></a>".html_safe unless staff_member.facebook.empty?
		when 'linkedin'
			"<a href='#{staff_member.linkedin}'><i class='fa fa-linkedin'></i></a>".html_safe unless staff_member.linkedin.empty?
		end
	end
end
