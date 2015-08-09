class Admin::HomeController < ApplicationController

	layout "admin_layout"
	include AdminHelper

  def index
    if !administrator?
      redirect_to :admin_login
    else
      @carousels = Carousel.all.sort_by(&:id)
      @services = Service.all.sort_by(&:id)
    end
  end

end
