module Admin::AdminHelper

	def upload(filename, tempfile, bucket='playhorse')
    s3 = Aws::S3::Client.new(region: 'eu-central-1')

    key = File.basename(filename)
    s3.put_object(
      acl: 'public-read',
      bucket: bucket,
      key: key,
      body: File.read(tempfile)
    )

    url = "https://#{bucket}.s3.eu-central-1.amazonaws.com/#{filename}"
    return url
	end

	def youtube_id(video_url)
		video_url.match(/youtube.com.*(?:\/|v=)([^&$]+)/)[1]
	end

end
