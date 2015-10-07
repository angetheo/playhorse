module Admin::AdminHelper



	def youtube_id(video_url)
		video_url.match(/youtube.com.*(?:\/|v=)([^&$]+)/)[1]
	end

end
