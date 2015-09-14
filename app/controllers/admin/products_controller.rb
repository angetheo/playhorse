class Admin::ProductsController < ApplicationController

	layout "admin_layout"
	
	before_filter :authenticate
	
  def index
  	@products = Product.all.sort_by(&:created_at).reverse
  end

end
