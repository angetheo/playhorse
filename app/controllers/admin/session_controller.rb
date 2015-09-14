class Admin::SessionController < ApplicationController

	layout "admin_layout"

  # SESSION ACTIONS #

  def login
  	if request.get?
  		render layout: false
  	elsif request.post?
  		if params[:phusername] == ENV['ADMIN_USER'] && params[:phpassword] == ENV['ADMIN_PASS']
  			session[:user] = params[:phusername]
  			redirect_to :admin_root
  		else
  			redirect_to :admin_login, alert: "L'username o la password non sono corretti. Per favore riprova."
  		end
  	end
  end

  def logout
  	session.clear
  	redirect_to '/'
  end

end
