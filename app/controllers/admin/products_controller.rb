class Admin::ProductsController < ApplicationController

	layout "admin_layout"
	include AdminHelper
	
  def index
  	@products = Product.all.sort_by(&:created_at).reverse
  end

end
