class SubscribersController < ApplicationController
  def create
  	Subscriber.create({
  		email: params[:subscriber_email]
  	})

  	flash[:notice] = "Iscrizione alla newsletter effettuata correttamente!"
    redirect_to :root
  end
end
