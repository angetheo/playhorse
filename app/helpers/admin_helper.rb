module AdminHelper
	def administrator?
		!!session[:user]
	end

	def upload(filename, tempfile)
	    s3 = Aws::S3::Client.new(region: 'eu-central-1')

	    key = File.basename(filename)
	    s3.put_object(
	      acl: 'public-read',
	      bucket: 'playhorse',
	      key: key,
	      body: File.read(tempfile)
	    )

	    url = "https://playhorse.s3.eu-central-1.amazonaws.com/#{filename}"
	    return url
  	end
end
