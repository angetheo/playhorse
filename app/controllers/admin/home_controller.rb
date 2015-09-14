class Admin::HomeController < ApplicationController

	layout "admin_layout"
	include AdminHelper

  before_filter :authenticate

  def index
    @carousels = Carousel.all.sort_by(&:id)
    @services = Service.all.sort_by(&:id)
  end

end
