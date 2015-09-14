class Admin::HorsesController < ApplicationController

	layout "admin_layout"
	
	before_filter :authenticate
	
  def index
  	@horses = Horse.all.sort_by(&:created_at).reverse
  end
end
