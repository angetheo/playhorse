class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    if !session[:user]
      redirect_to :admin_login, alert: 'Errore: effettua il login prima di visitare la pagina.'
    end
  end

  def contact
    ContactMailer.send_request(params)
    redirect_to :root, notice: "<b>Messaggio Inviato!</b> Grazie per averci contattato! Ti risponderemo al più presto."
  end

  protected

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
end
