module AdminHelper

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

  def bucket_size_left(bucket_name)
    playhorse = Aws::S3::Bucket.new(name: bucket_name)
    occupied_storage = 0
    total_storage = 5*1024

    playhorse.objects.each do |objectsummary|
      occupied_storage += objectsummary.size/1024/1024
    end

    residual_storage = ((total_storage-occupied_storage)/total_storage.to_f)*100.to_f
    residual_storage.round(1)
  end

  ################
  # DB ROWS LEFT #
  ################

  def rows_left
    used_rows = 0
		ActiveRecord::Base.send(:subclasses).each do |sc| 
    	used_rows += sc.all.size
		end
		return 10_000 - used_rows
  end

end
