class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    if !session[:user]
      redirect_to :admin_login, alert: 'Errore: effettua il login prima di visitare la pagina.'
    end
  end

  def twitter_login
  	Twitter::REST::Client.new do |config|
  		config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  		config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  		config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  		config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
		end
	end

  def contact
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

    flash[:notice] = "<b>Messaggio Inviato!</b> Grazie per averci contattato! Ti risponderemo al più presto."
    redirect_to :root
  end
end
