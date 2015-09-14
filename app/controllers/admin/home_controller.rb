class Admin::HomeController < ApplicationController

	layout "admin_layout"

  before_filter :authenticate

  def index
    @carousels = Carousel.all.sort_by(&:id)
    @services = Service.all.sort_by(&:id)
  end

end
