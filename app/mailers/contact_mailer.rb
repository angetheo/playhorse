class ContactMailer < ApplicationMailer
	def self.send_request(params)
		options = {
      :to => 'supporto@playhorsefarm.com',
      :from => params[:contact_email],
      :subject => params[:contact_subject],
      :body => params[:contact_message],
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
        }
    }

    Pony.mail(options)
  end
end
